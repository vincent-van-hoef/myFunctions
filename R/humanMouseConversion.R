#' Basic function to convert human to mouse gene names
#' @export
convertHumanGeneList <- function(x){
human 	<- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
mouse 	<- useMart("ensembl", dataset = "mmusculus_gene_ensembl")
tmp 	<- getLDS(attributes = c("hgnc_symbol"), filters = "hgnc_symbol", values = x , mart = human, attributesL = c("mgi_symbol"), martL = mouse, uniqueRows=TRUE)
mousex 	<- unique(tmp[,2])
return(mousex)
}
 
