library(quantileVaR)

source('varTest_MR.r')
source('Christoffersen.r')
source('DQ_MR.r')

logretdm <- read.csv("logretdm.csv")
logretdm <- logretdm[,-1]

tauVec = c(0.01, 0.025, 0.05, 0.10,0.15,0.20, 0.25, 0.30, 0.35,0.40,0.45,0.50,0.55,0.60,0.65,0.70,0.75,0.80,0.85,0.90, 0.95, 0.975, 0.99)

tauVec2 = c(0.01, 0.05, 0.95, 0.99)

dvec <- seq(1, 4513, by=1)
dvec2 <- seq(1, 4523, by=1)

# Compute Coverage tests
dist_OOS <- read.csv("dist_OOS_3M.csv", header=TRUE)
dist_OOS <- dist_OOS[,-1]
ret <- logretdm[4002:8514,3]
M3 <- varTest_MR(tauVec, ret, dist_OOS)

dist_OOS <- read.csv("dist_OOS_1Y.csv", header=TRUE)
dist_OOS <- dist_OOS[,-1]
ret <- logretdm[4002:8514,12]
Y1 <- varTest_MR(tauVec, ret, dist_OOS)

dist_OOS <- read.csv("dist_OOS_5Y.csv", header=TRUE)
dist_OOS <- dist_OOS[,-1]
ret <- logretdm[4002:8514,60]
Y5 <- varTest_MR(tauVec, ret, dist_OOS)

dist_OOS <- read.csv("dist_OOS_10Y.csv", header=TRUE)
dist_OOS <- dist_OOS[,-1]
ret <- logretdm[4002:8514,120]
Y10 <- varTest_MR(tauVec, ret, dist_OOS)

dist_OOS <- read.csv("dist_OOS_30Y.csv", header=TRUE)
dist_OOS <- dist_OOS[,-1]
ret <- logretdm[4002:8514,360]
Y30 <- varTest_MR(tauVec, ret, dist_OOS)

c3M <- matrix(0,1,12)
c3M[1,1] <- M3[1,8]
c3M[1,2] <- M3[1,6]
c3M[1,3] <- M3[2,8]
c3M[1,4] <- M3[2,6]
c3M[1,5] <- M3[3,8]
c3M[1,6] <- M3[3,6]
c3M[1,7] <- M3[21,8]
c3M[1,8] <- M3[21,6]
c3M[1,9] <- M3[22,8]
c3M[1,10] <- M3[22,6]
c3M[1,11] <- M3[23,8]
c3M[1,12] <- M3[23,6]

c1Y <- matrix(0,1,12)
c1Y[1,1] <- Y1[1,8]
c1Y[1,2] <- Y1[1,6]
c1Y[1,3] <- Y1[2,8]
c1Y[1,4] <- Y1[2,6]
c1Y[1,5] <- Y1[3,8]
c1Y[1,6] <- Y1[3,6]
c1Y[1,7] <- Y1[21,8]
c1Y[1,8] <- Y1[21,6]
c1Y[1,9] <- Y1[22,8]
c1Y[1,10] <- Y1[22,6]
c1Y[1,11] <- Y1[23,8]
c1Y[1,12] <- Y1[23,6]

c5Y <- matrix(0,1,12)
c5Y[1,1] <- Y5[1,8]
c5Y[1,2] <- Y5[1,6]
c5Y[1,3] <- Y5[2,8]
c5Y[1,4] <- Y5[2,6]
c5Y[1,5] <- Y5[3,8]
c5Y[1,6] <- Y5[3,6]
c5Y[1,7] <- Y5[21,8]
c5Y[1,8] <- Y5[21,6]
c5Y[1,9] <- Y5[22,8]
c5Y[1,10] <- Y5[22,6]
c5Y[1,11] <- Y5[23,8]
c5Y[1,12] <- Y5[23,6]

c10Y <- matrix(0,1,12)
c10Y[1,1] <- Y10[1,8]
c10Y[1,2] <- Y10[1,6]
c10Y[1,3] <- Y10[2,8]
c10Y[1,4] <- Y10[2,6]
c10Y[1,5] <- Y10[3,8]
c10Y[1,6] <- Y10[3,6]
c10Y[1,7] <- Y10[21,8]
c10Y[1,8] <- Y10[21,6]
c10Y[1,9] <- Y10[22,8]
c10Y[1,10] <- Y10[22,6]
c10Y[1,11] <- Y10[23,8]
c10Y[1,12] <- Y10[23,6]

c30Y <- matrix(0,1,12)
c30Y[1,1] <- Y30[1,8]
c30Y[1,2] <- Y30[1,6]
c30Y[1,3] <- Y30[2,8]
c30Y[1,4] <- Y30[2,6]
c30Y[1,5] <- Y30[3,8]
c30Y[1,6] <- Y30[3,6]
c30Y[1,7] <- Y30[21,8]
c30Y[1,8] <- Y30[21,6]
c30Y[1,9] <- Y30[22,8]
c30Y[1,10] <- Y30[22,6]
c30Y[1,11] <- Y30[23,8]
c30Y[1,12] <- Y30[23,6]

# Table 2
hit <- data.frame(cbind(M3[,1:2], Y1[,2], Y5[,2], Y10[,2], Y30[,2]))
table2 <- hit
colnames(table2) <- c("q", "3m", "1y", "5y", "10y", "30y")
round(table2, 2)

# Table 3
coverage <- rbind.data.frame(c3M,c1Y,c5Y,c10Y,c30Y)
table3 <- coverage
rownames(table3) <- c("3m", "1y", "5y", "10y", "30y")
colnames(table3) <- c("UC_1","CCI_1","UC_2.5","CCI_2.5","UC_5","CCI_5","UC_95","CCI_95","UC_97.5","CCI_97.5","UC_99","CCI_99")
round(table3, 2)