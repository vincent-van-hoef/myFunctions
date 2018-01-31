#' Convert the rownames of a dataframe or matrix to a different ID
 
#' @description This function can take any of the columns(org.Hs.eg.db) as type and keys as long as the row names are in the format of the keys argument
#' @param df Dataframe of matrix whose rownames are to be converted.
#' @param type Format of converted rownames: e.g. "SYMBOL" or "ENTREZID"
#' @param keys Present format of rownames: e.g. "SYMBOL" or "ENTREZID"
#' @param db Annotation database: e.g. "org.Hs.eg.db" or "org.Mm.eg.db"
#' @examples M1entrez <- getMatrixWithSelectedIds(M1symb, type="ENTREZID", keys="SYMBOL", db = org.Mm.eg.db)
#' @export
getMatrixWithSelectedIds <- function(df, type, keys, db){
geneSymbols 	<- mapIds(db, keys=rownames(df), column=type, keytype=keys, multiVals="first")
inds 		<- which(!is.na(geneSymbols))
found_genes 	<- geneSymbols[inds]
df2 		<- df[names(found_genes), ]
rownames(df2) 	<- found_genes
return(df2)
}
