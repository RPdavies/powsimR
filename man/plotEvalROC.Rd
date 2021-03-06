% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plot.R
\name{plotEvalROC}
\alias{plotEvalROC}
\title{Visualize error rate curves and associated summary statistics}
\usage{
plotEvalROC(evalRes,
cutoff=c('liberal', 'conservative'),
Annot=TRUE)
}
\arguments{
\item{evalRes}{The output of \code{\link{evaluateROC}}.}

\item{cutoff}{Character vector defining whether the \code{"liberal"} or \code{"conservative"} FDR control is considered.}

\item{Annot}{A logical vector. If \code{TRUE}, a short figure legend under the plot is included.}
}
\value{
A ggplot object.
}
\description{
This function plots the results of \code{\link{evaluateROC}} for assessing relative operating characteristic curves and summary statistics.
}
\examples{
\dontrun{
# estimate gene parameters
data("CELseq2_Gene_UMI_Counts")
estparam_gene <- estimateParam(countData = CELseq2_Gene_UMI_Counts,
                               readData = NULL,
                               batchData = NULL,
                               spikeData = NULL, spikeInfo = NULL,
                               Lengths = NULL, MeanFragLengths = NULL,
                               RNAseq = 'singlecell', Protocol = 'UMI',
                               Distribution = 'NB', Normalisation = "scran",
                               GeneFilter = 0.1, SampleFilter = 3,
                               sigma = 1.96, NCores = NULL, verbose = TRUE)
# define log2 fold change
p.lfc <- function(x) sample(c(-1,1), size=x,replace=T)*rgamma(x, shape = 1, rate = 2)
# set up simulations
setupres <- Setup(ngenes = 10000, nsims = 10,
                  p.DE = 0.1, pLFC = p.lfc,
                  n1 = c(20,50,100), n2 = c(30,60,120),
                  Thinning = NULL, LibSize = 'equal',
                  estParamRes = estparam_gene,
                  estSpikeRes = NULL,
                  DropGenes = FALSE,
                  sim.seed = 34269, verbose = TRUE)
# run simulation
simres <- simulateDE(SetupRes = setupres,
                     Prefilter = "FreqFilter", Imputation = NULL,
                     Normalisation = 'scran', Label = 'none',
                     DEmethod = "limma-trend", DEFilter = FALSE,
                     NCores = NULL, verbose = TRUE)
# evaluation
evalrocres <- evaluateROC(simRes = simres,
                          alpha.type = "adjusted",
                          MTC = 'BH', alpha.nominal = 0.05,
                          raw = FALSE)
# plot evaluation
plotEvalROC(evalRes = evalrocres, cutoff = "conservative", Annot = TRUE)
}
}
\author{
Beate Vieth
}
