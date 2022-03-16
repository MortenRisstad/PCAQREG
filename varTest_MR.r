varTest_MR <- function(prob, y, VaR){
	
	nP <- length(prob)
	if(!is.null(dim(VaR))){ if(ncol(VaR)!=nP) stop("Number of VaR columns do not mach number of probabilities.") }
					else { if(nP!=1) stop("Number of VaR columns do not mach number of probabilities.") }	
	
	mOut <- matrix(NA, ncol=8, nrow=nP)
	mOut[ , 1] <- prob
	colnames(mOut) <- c("Prob", "Hit(%)", "Test-stat(DQ)", "P-value(DQ)", "Test-stat(CC)", "P-value(CC)","Test-stat(Kupiec)", "P-value(Kupiec)")
  
	for(i in 1:length(prob)){
		VaR.i <- VaR[, i]
		if(length(y)!=length(VaR.i)) stop("y and VaR do not have the same length! ")
    
		Coverage <- Christoffersen1998( prob[i], y, VaR.i)
    
		mOut[i, 2] <- mean(y<VaR.i)
		mOut[i, 3] <- DQ_MR(Y=y, VAR=VaR.i, prob=prob[i])$DQ
		mOut[i, 4] <- DQ_MR(Y=y, VAR=VaR.i, prob=prob[i])$p_val
		mOut[i, 5] <- Coverage$t.cond
		mOut[i, 6] <- Coverage$p.cond
		mOut[i, 7] <- Coverage$t.uncond
		mOut[i, 8] <- Coverage$p.uncond
	}
	format(round(mOut, 4), nsmall = 4)
	mOut
}