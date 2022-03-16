rm(list = ls(all.names = TRUE)) # cleans Global Environment
cat("\f") # clears Console
dev.off() # clears plots 


library(quantreg)


source("fQRegCoeff.R")
source("ewma.R")

### IMPORT DATA

logret <- read.csv('logretdm.csv') # log-change
logret <- logret[,-1] # log-change


### OUT-OF-SAMPLE ROLLING WINDOW PCA-QREG ESTIMATION

## Parameters
z <- 250 # cut of last z observations
w <- 4000 # length of estimation window
nOOS <- nrow(logret)-w-z # total number of OOS estimates

# vector of quantiles to estimate
tauVec = c(0.01, 0.025, 0.05, 0.10,0.15,0.20,
           0.25, 0.30, 0.35,0.40,0.45,0.50,
           0.55,0.60,0.65,0.70,0.75,0.80,
           0.85,0.90, 0.95, 0.975, 0.99)

# containers for yield log-change estimates
dist.M3 <- matrix(0,nOOS,length(tauVec)) #3M
dist.Y1 <- matrix(0,nOOS,length(tauVec)) #1Y
dist.Y5 <- matrix(0,nOOS,length(tauVec)) #5Y
dist.Y10 <- matrix(0,nOOS,length(tauVec)) #10Y
dist.Y30 <- matrix(0,nOOS,length(tauVec)) #30Y


# EWMA persistency parameter
par.lamda <- 0.98

# dummy index variables used in estimation
counter <- w
OOS.counter <- 0

for(row in (w+1):(nrow(logret)-z)) 
  
{
  counter <- counter + 1
  OOS.counter <- OOS.counter + 1
  
  logret.sample <- data.matrix(logret[(counter-w+1):counter,])
  
  ### Compute quantile regression risk factors at time t
  
  # Principal Component Analysis
  PCA.sample <- prcomp(logret.sample,scale. = T, rank. = 3)
  PC.vals.sample <- PCA.sample$x
  
  # Conditional volatility of first three Principal Components (EWMA)
  sigma.tmp <- ewma(PC.vals.sample,par.lamda,1)
  
  # Explanatory variables in quantile regressions
  rhs <- sigma.tmp[[2]]
  
  
  ### Compute quantile estimates for relevant maturities
  
  ## 3m_____________________
  
  # Estimate quantile regression
  lhs.M3 <- data.matrix(logret[(counter-w+1):counter,3])
  fit.M3 <- rq(lhs.M3~rhs, tau = tauVec) # estimate quantile regression
  c<-fQRegCoeff(fit.M3) # extract quantile regression coefficients
  
  # Distibutional estimate
  dist.tmp <- rhs[nrow(rhs),]%*%c[2:4,] # compute distribution
  dist.tmp[1,] <- dist.tmp[1,]+c[1,]
  dist.M3[OOS.counter,] <- dist.tmp
  
  
  ## 1y_____________________
  
  # Estimate quantile regression
  lhs.Y1 <- data.matrix(logret[(counter-w+1):counter,12]) 
  fit.Y1 <- rq(lhs.Y1~rhs, tau = tauVec) # estimate quantile regression
  c<-fQRegCoeff(fit.Y1) # extract quantile regression coefficients
  
  # Distibutional estimate
  dist.tmp <- rhs[nrow(rhs),]%*%c[2:4,] # compute distribution
  dist.tmp[1,] <- dist.tmp[1,]+c[1,]
  dist.Y1[OOS.counter,] <- dist.tmp
  
  
  ## 5y_____________________
  
  # Estimate quantile regression
  lhs.Y5 <- data.matrix(logret[(counter-w+1):counter,60])
  fit.Y5 <- rq(lhs.Y5~rhs, tau = tauVec) # estimate quantile regression
  c<-fQRegCoeff(fit.Y5) # extract quantile regression coefficients
  
  # Distibutional estimate
  dist.tmp <- rhs[nrow(rhs),]%*%c[2:4,] # compute distribution
  dist.tmp[1,] <- dist.tmp[1,]+c[1,]
  dist.Y5[OOS.counter,] <- dist.tmp # first estimate day is for t = 2, dvs compares to logret at t=2
  
  
  ## 10y_____________________
  
  # Estimate quantile regression
  lhs.Y10 <- data.matrix(logret[(counter-w+1):counter,120])
  fit.Y10 <- rq(lhs.Y10~rhs, tau = tauVec) # estimate quantile regression
  c<-fQRegCoeff(fit.Y10) # extract quantile regression coefficients
  
  # Distibutional estimate
  dist.tmp <- rhs[nrow(rhs),]%*%c[2:4,] # compute distribution
  dist.tmp[1,] <- dist.tmp[1,]+c[1,]
  dist.Y10[OOS.counter,] <- dist.tmp
  
  
  ## 30y_____________________
  
  # Estimate quantile regression
  lhs.Y30 <- data.matrix(logret[(counter-w+1):counter,360])
  fit.Y30 <- rq(lhs.Y30~rhs, tau = tauVec) # estimate quantile regression
  c<-fQRegCoeff(fit.Y30) # extract quantile regression coefficients
  
  # Distibutional estimate
  dist.tmp <- rhs[nrow(rhs),]%*%c[2:4,] # compute distribution
  dist.tmp[1,] <- dist.tmp[1,]+c[1,]
  dist.Y30[OOS.counter,] <- dist.tmp
}

#### write results to .csv files

write.csv(dist.M3,'dist_OOS_3M.csv') # 3M
write.csv(dist.Y1,'dist_OOS_1Y.csv') # 1Y
write.csv(dist.Y5,'dist_OOS_5Y.csv') # 5Y
write.csv(dist.Y10,'dist_OOS_10Y.csv') # 10Y
write.csv(dist.Y30,'dist_OOS_30Y.csv') # 30Y





