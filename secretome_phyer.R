data = read.delim("/Users/ethering/projects/charala/go_found_notfound.txt", header=TRUE, sep="\t")
#header and line example:
#go_term	description	secretome_genes	non_secretome_genes	prob of combination	expected	population	p-value
#GO:0016798	hydrolase activity, acting on glycosyl bonds	1	0	1	0.064151	1	0

#parameters
#sumOfPopulation - the total number of genes in the geneome (secretome and non-secretome) 10405 in this case
#noGoTerms - the total number of GO IDs found in the geneome
#genesInSec - the total number of genes in the secretome, 970 in this case

secphyper <- function(data, sumOfPopulation, noGoTerms, genesInSec)
{
  #nFound - the number of genes in the secretome that are attributed to the current GO ID
  nFound <- as.numeric(data["secretome_genes"])
  #nAtCat - the total number of genes in the genome containing the current GO ID
  nAtCat <- as.numeric(data["population"])
  #nNotAtCat - the number of genes in the geneome minus the number of secretome genes for the current GO ID
  nNotAtCat <- sumOfPopulation - nAtCat
  #phyper(nFound, nAtCat, nNotAtCat, nDrawn, lower.tail=FALSE)
  pval = phyper(nFound, nAtCat, nNotAtCat, genesInSec, lower.tail=FALSE)* noGoTerms
  sprintf("%.10f", pval)
}

results <- apply(data, 1, secphyper,  sumOfPopulation <- 10405, noGoTerms <- length(data$go_term), genesInSec <- 970)
print(results)
go_terms = as.vector(data$go_term)
go_results <- cbind(go_terms, as.vector(results))
outfile <- ("/Users/ethering/projects/charala/go_pvals.txt")
write(go_results, outfile, sep="\t")