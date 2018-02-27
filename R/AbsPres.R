#' Convert a list of e.g. genes into a absence/presence data frame with all genes as rownames and each column a list element. 
#' @description A one indicates the presence of a gene in the particular list element, a zero indicates its absence. Potential use of this function is to attach a list of signatures to an expression matrix for downstream analysis or plotting
#' @param x A list of vectors containing sets of genes or proteins
#' @export
listToAbsPres <- function(x){
	allElements 		<- sort(unique(unlist(x))) 
	presMat 		<- matrix(0, nrow = length(allElements), ncol = length(x))
	rownames(presMat) 	<- allElements
	colnames(presMat) 	<- names(x)
	for(element in allElements){
		for(set in names(x)){
			if(element %in% x[[set]])
			presMat[element, set] <- 1
						}
					}
	return(as.data.frame(presMat))
}
