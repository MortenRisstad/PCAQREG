library(forecast)

library(readr)

VaRHSLOSS <- read_csv("VaRHSLOSS.csv", col_names = FALSE, show_col_types = FALSE)
VaRPCAQREGLOSS <- read_csv("VaRPCAQREGLOSS.csv", col_names = FALSE, show_col_types = FALSE)

dm.pvals <- matrix(0,1,3)

dm.D <-dm.test(
  as.matrix(VaRHSLOSS[,1]),
  as.matrix(VaRPCAQREGLOSS[,1]),
  #alternative = c("two.sided", "less", "greater"),
  alternative = c( "greater"),
  h = 1,
  power = 2
)

dm.pvals[1,1] <- dm.D$p.value

dm.D <-dm.test(
  as.matrix(VaRHSLOSS[,2]),
  as.matrix(VaRPCAQREGLOSS[,2]),
  #alternative = c("two.sided", "less", "greater"),
  alternative = c( "greater"),
  h = 1,
  power = 2
)

dm.pvals[1,2] <- dm.D$p.value

dm.D <-dm.test(
  as.matrix(VaRHSLOSS[,3]),
  as.matrix(VaRPCAQREGLOSS[,3]),
  #alternative = c("two.sided", "less", "greater"),
  alternative = c( "greater"),
  h = 1,
  power = 2
)

dm.pvals[1,3] <- dm.D$p.value

table4 <- dm.pvals
rownames(table4) <- c("p-value")
colnames(table4) <- c("1%","2.5%","5%")
round(table4, 2)