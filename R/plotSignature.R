function(x, effCol, signatureList, xlab, xlim){
    all <- rownames(x)
    for(signature in 1:length(signatureList)){
        signatureName <- names(signatureList)[signature]
        signature <- signatureList[[signature]]
        signature <- signature[signature %in% all]
        bkg <- setdiff(all,signature)
        # Plot ecdf    
        ecdfBkg <- ecdf(x = x[bkg,effCol])
        ecdfSigs <- ecdf(x = x[signature,effCol])
	# Calculate the difference between the mean effects of background and signature
	sigDiff <- mean(x[bkg, effCol]) - mean(x[signature, effCol])
	# Calculate the wilcoxon p-value for the difference between the two ecdfs 
	..
        plot(ecdfBkg, main=signatureName, xlab=xlab, xlim = xlim)
        lines(ecdfSigs, col="red")
        }
    }
