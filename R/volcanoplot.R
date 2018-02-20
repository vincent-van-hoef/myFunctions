#' Make a volcanoplot of effect vs p-value and calculate the number of elements of the differently regulated groups  
 
#' @description This function takes a matrix or dataframe as input and upon specifying the correct columns output the number of elements in the differently regulated groups. Optionally, the volcanoplot is also plotted. A log10 transformation of the p-value column can also be applied 
#' @param x Dataframe of matrix to be plotted
#' @param pCol Name of column contianing the p-values 
#' @param effCol Name of column containing the effect sizes
#' @param minP p-value cutoff
#' @param minEff Effect size cutoff
#' @param log10 Logical indicating whether to log transform the p-values
#' @param plot Logical indicating whether to plot or not
#' @examples volcanoplot(x, pCol="pVal", effCol = "log2FC", minP = 0.05, minEff = 1, log10 = TRUE, plot = TRUE)
#' @export
volcanoplot <- function(x, pCol, effCol, minP, minEff,log10=TRUE, plot = TRUE, ...){
	if(log10 == TRUE){
	x[, pCol] <- -log10(x[,pCol])
	minP <- -log10(minP)
	}
  upSig <- dim(subset(x, x[, pCol] > minP & x[, effCol] > minEff))[1]
  downSig <- dim(subset(x, x[, pCol] > minP & x[, effCol] < -minEff))[1]
  upNoSig <- dim(subset(x, x[, pCol] < minP & x[, effCol] > minEff))[1]
  downNoSig <- dim(subset(x, x[, pCol] < minP & x[, effCol] < -minEff))[1]
  numbers <- c(upSig, downSig, upNoSig, downNoSig)
  names(numbers) <- c("upSig", "downSig", "upNoSig", "downNoSig")
  if(plot == "TRUE") {
    plot(x[,effCol], x[, pCol], ylim = c(0, max(x[, pCol])), xlim = c(-max(x[,effCol]),max(x[,effCol])))
    text(x = -max((x[,effCol])) + 1, y = max(x[, pCol]) - 0.5, labels = numbers[2])
    text(x = max((x[,effCol])) - 2, y = max(x[, pCol]) - 0.5, labels = numbers[1])
    text(x = -max((x[,effCol])) + 1, y = 0.5, labels = numbers[4])
    text(x = max((x[,effCol])) - 2, y = 0.5, labels = numbers[3])
    abline(v=c(-minEff,minEff), h=minP)
  }
  numbers
}

