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

create_Exp1_R25_pept <- function(){
data.file <- system.file("extdata", "Exp1_R25_pept.txt", package="DAPARdata2")
data <- read.table(data.file, header=TRUE, sep="\t", as.is=TRUE, stringsAsFactors = FALSE)

sample.file <- system.file("extdata", "samples_Exp1_R25.txt", package="DAPARdata2")
sample <- read.table(sample.file, header=TRUE, sep="\t", as.is=TRUE, stringsAsFactors = FALSE)

Exp1_R25_pept <- createQFeatures(data = data, 
                                 sample = sample, 
                                 indQData = 56:61, 
                                 keyId = "Sequence", 
                                 indQMetadata = 43:48,
                                 logTransform = TRUE, 
                                 forceNA = TRUE,
                                 typeDataset = "peptide",
                                 parentProtId = "Protein_group_IDs",
                                 analysis = 'foo',
                                 processes = NULL,
                                 typePipeline = NULL,
                                 software = 'maxquant')

save(Exp1_R25_pept, file = 'data/Exp1_R25_pept.RData', compress='xz')
saveRDS(Exp1_R25_pept, file = 'inst/extdata/Exp1_R25_pept.ft')
}