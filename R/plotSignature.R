#' A function to plot the ecdf of a list of signature genesets in a dataset as well as the complementary background ecdf.
#' @description Provide a dataframe x containing the statistic to be plotted (e.g. logFC) and a list of signatures in the same format as the rownames of the data frame. The ecdf of the rownames of the df x belonging to the signature will be plotted as well as the complementary background.
#' @param x Dataframe of matrix containing the value to be used for the ecdf calculation
#' @param effCol colname of number of column of the value to be used for the ecdf calculation
#' @param signatureList Named list of signatures, vector in same format as rownames of x
#' @param xlab Label of the ecdf plot x-axis
#' @param xlim Limits of the x-axis of the plot
#' @export
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
