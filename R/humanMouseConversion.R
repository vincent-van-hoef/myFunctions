#' Basic function to convert human to mouse gene names
#' @export
convertHumanGeneList <- function(x){
human = useMart("ensembl", dataset = "hsapiens_gene_ensembl")
mouse = useMart("ensembl", dataset = "mmusculus_gene_ensembl")
genesV2 = getLDS(attributes = c("hgnc_symbol"), filters = "hgnc_symbol", values = x , mart = human, attributesL = c("mgi_symbol"), martL = mouse, uniqueRows=T)
mousex <- unique(genesV2[, 2])
return(mousex)
}
 
