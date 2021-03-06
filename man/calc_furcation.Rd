% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_furcation.R
\name{calc_furcation}
\alias{calc_furcation}
\title{calculate furcation trees around a focal marker}
\usage{
calc_furcation(
  haplohh,
  mrk,
  allele = NA,
  limhaplo = 2,
  phased = TRUE,
  polarized = TRUE
)
}
\arguments{
\item{haplohh}{an object of class haplohh (see \code{\link{data2haplohh}}).}

\item{mrk}{integer representing the number of the focal marker within the haplohh object
or string representing its ID/name.}

\item{allele}{a vector of alleles as coded internally, i.e. in case of polarized alleles,
0 represents the ancestral, 1 or higher the derived alleles.
If \code{NULL}, all alleles of the focal marker are considered.}

\item{limhaplo}{if there are less than \code{limhaplo} chromosomes that can be used for
the calculation, it is stopped. This is useful in case of missing data,
which lead to a successive exclusion of haplotypes: the further away from the focal marker
the less haplotypes are evaluated.}

\item{phased}{logical. If \code{TRUE} (default), chromosomes are expected to be phased.
If \code{FALSE}, consecutive chromosomes are assumed to
belong to diploid individuals and furcation trees are limited to within individuals which
are homozygous at the focal marker.}

\item{polarized}{logical. Affects only the order of furcations. If \code{TRUE} (default), the ancestral allele
becomes the first furcation and derived alleles are sorted by their internal coding. Otherwise all alleles
are sorted by their internal coding.}
}
\value{
An object of class furcation, containing the furcation structure of the specified alleles at the focal marker.
}
\description{
Calculate furcation trees around a focal marker. A furcation tree captures
in greater detail than EHH values the decrease of extended haplotype homozygosity at
increasing distances from the selected focal marker.
}
\details{
A haplotype furcation tree visualizes the breakdown
of LD at increasing distances from the focal marker.
The root of each tree is an allele of the focal marker, which in turn is identified
by a vertical dashed line.
Moving either to the "left" or to the "right" of the focal marker, each further marker is an opportunity for a node;
the tree either divides or does not, based on whether alleles at that marker
distinguish between hitherto identical extended haplotypes.
The thickness of the lines corresponds to the number of chromosomes sharing an extended haplotype.
}
\examples{
#example haplohh object (280 haplotypes, 1424 SNPs)
#see ?haplohh_cgu_bta12 for details
data(haplohh_cgu_bta12)
#plotting a furcation diagram for both ancestral and derived allele
#from the marker "F1205400"
#which display a strong signal of selection
f <- calc_furcation(haplohh_cgu_bta12, mrk = "F1205400")
plot(f)
}
\references{
Sabeti, P.C. and Reich, D.E. and Higgins, J.M. and Levine, H.Z.P and Richter, D.J. and Schaffner, S.F. and Gabriel, S.B. and Platko, J.V. and Patterson, N.J. and McDonald, G.J. and Ackerman, H.C. and Campbell, S.J. and Altshuler, D. and Cooper, R. and Kwiatkowski, D. and Ward, R. and Lander, E.S. (2002). Detecting recent positive selection in the human genome from haplotype structure. Nature, 419, 832-837.
}
\seealso{
\code{\link{plot.furcation}}, \code{\link{calc_haplen}}.
}
