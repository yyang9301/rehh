% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ihh2ihs.R
\name{ihh2ihs}
\alias{ihh2ihs}
\title{Compute iHS}
\usage{
ihh2ihs(
  scan,
  freqbin = 0.025,
  min_maf = 0.05,
  min_nhaplo = NA,
  standardize = TRUE,
  include_freq = FALSE,
  right = FALSE,
  alpha = 0.05,
  p.side = NA,
  p.adjust.method = "none",
  verbose = TRUE
)
}
\arguments{
\item{scan}{a data frame with chromosome name,
marker position, frequency of ancestral (resp. major) allele, frequency of derived (resp. minor)
allele, and iHH for both alleles, as obtained from function \code{\link{scan_hh}}.}

\item{freqbin}{size of the bins to standardize log(iHH_A/iHH_D). Markers are binned with
respect to the derived allele frequency at the focal marker. The bins are built from
\code{min_maf} to \code{1-min_maf} in steps of size \code{freqbin}. If set to 0, standardization
is performed considering each observed frequency as a discrete frequency
class (useful in case of a large number of markers and few different haplotypes).
If set to an integer of 1 or greater, a corresponding number of equally sized bins are created.}

\item{min_maf}{focal markers with a MAF (Minor Allele Frequency) lower than or equal to \code{min_maf}
are discarded from the analysis (default 0.05).}

\item{min_nhaplo}{focal markers with least one of the two compared alleles carried by fewer
than \code{min_nhaplo} haplotypes, are discarded (default \code{NA}).}

\item{standardize}{logical. If \code{TRUE} (default), then standardize iHS, else report unstandardized iHS.}

\item{include_freq}{logical. If \code{TRUE} include columns with allele frequencies into result.}

\item{right}{logical. If \code{TRUE} the bin intervals are closed on the right (and open on the left).}

\item{alpha}{calculate quantiles \code{alpha/2} and \code{(1-alpha/2)} for unstandardized binned iHS.}

\item{p.side}{side to which refers the p-value. Default \code{NA}, meaning two-sided. Can be set
to \code{"left"} or \code{"right"}.}

\item{p.adjust.method}{method passed to function \code{\link[stats]{p.adjust}} to correct the p-value for
multiple testing. Default \code{"none"}.}

\item{verbose}{logical. If \code{TRUE} (default), report number of markers of the source data frame and result data frame.}
}
\value{
The returned value is a list containing two elements
\describe{
\item{ihs}{a data frame with markers in rows and the columns for chromosome name, marker position,
iHS and, if standardized, p-value in a negative log10 scale. Optionally, allele frequencies are included.}
\item{frequency.class}{a data frame with bins in rows and columns for
the number of markers, mean uniHS, standard deviation uniHS, lower quantile uniHS, upper quantile uniHS.}
}
}
\description{
Compute iHS (standardized ratio of iHH values of two alleles).
}
\details{
Computes log ratio of iHH of two focal alleles as described in Voight et al. (2006). The standardization
is performed within each bins separately because of the frequency-dependence
of expected iHS values under neutrality. An implicit assumption of this
approach is that each bin is dominated by neutral markers.

Since the standardized iHS values follow, if markers evolve predominantly neutrally, approximately
a standard Gaussian distribution, it is practical to assign to the values a p-value relative
to the null-hypothesis of neutral evolution. The parameter \code{p.side} determines
if the p-value is assigned to both sides of the distribution or to one side of interest.
}
\examples{
library(rehh.data)
data(wgscan.cgu)
#results from a genome scan (44,057 SNPs)
#see ?wgscan.eut and ?wgscan.cgu for details
wgscan.cgu.ihs <- ihh2ihs(wgscan.cgu)
}
\references{
Gautier, M. and Naves, M. (2011). Footprints of selection in the ancestral admixture of a New World Creole cattle breed. \emph{Molecular Ecology}, \strong{20}, 3128-3143.

Voight, B.F. and Kudaravalli, S. and Wen, X. and Pritchard, J.K. (2006). A map of recent positive selection in the human genome. \emph{Plos Biology}, \strong{4}, e72.
}
\seealso{
\code{\link{scan_hh}}, \code{\link{distribplot}}, \code{\link{freqbinplot}}, \code{\link{manhattanplot}}
}
