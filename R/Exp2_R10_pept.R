#' @title xxxxxx
#' 
#' @description xxx
#' 
#' @return xxx 
#' 
#' @author Enora Fremy, Samuel Wieczorek
#' 
#' @importFrom Dapar2 createQFeatures
#' @importFrom utils read.table
#' 
#' @export
#' 

create_Exp2_R10_pept <- function(){
data.file <- system.file("extdata", "Exp2_R10_pept.txt", package="DAPARdata2")
data <- read.table(data.file, header=TRUE, sep="\t", as.is=TRUE, stringsAsFactors = FALSE)

sample.file <- system.file("extdata", "samples_Exp2_R10.txt", package="DAPARdata2")
sample <- read.table(sample.file, header=TRUE, sep="\t", as.is=TRUE, stringsAsFactors = FALSE)

Exp2_R10_pept <- createQFeatures(data = data, 
                                 sample = sample, 
                                 indQData = 1:6, 
                                 keyId = 'Sequence', 
                                 indQMetadata = 49:54,
                                 logTransform = TRUE, 
                                 forceNA = TRUE,
                                 typeDataset = "peptide",
                                 parentProtId = "Protein_group_IDs",
                                 analysis = 'foo',
                                 processes = NULL,
                                 typePipeline = NULL,
                                 software = 'maxquant')
save(Exp2_R10_pept, file = 'data/Exp2_R10_pept.RData', compress='xz')
saveRDS(Exp2_R10_pept, file = 'inst/extdata/Exp2_R10_pept.ft')
}