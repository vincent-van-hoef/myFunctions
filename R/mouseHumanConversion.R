#' Basic function to convert mouse to human gene names
#' This function converts a vector of mouse gene symbols to human gene symbols.
#' @param x A vector of mouse genes
#' @export 
convertMouseGeneList <- function(x){
human = useMart("ensembl", dataset = "hsapiens_gene_ensembl")
mouse = useMart("ensembl", dataset = "mmusculus_gene_ensembl")
genesV2 = getLDS(attributes = c("mgi_symbol"), filters = "mgi_symbol", values = x , mart = mouse, attributesL = c("hgnc_symbol"), martL = human, uniqueRows=T)
humanx <- unique(genesV2[, 2])
return(humanx)
}
