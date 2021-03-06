% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/slide.freq.R
\name{slide.freq}
\alias{slide.freq}
\title{Sliding window measurements of clade posterior probabilities.}
\usage{
slide.freq(tree.list, burnin = 0, window.size, gens.per.tree = 1)
}
\arguments{
\item{tree.list}{A rwty trees object or multiPhylo.}

\item{burnin}{The number of trees to eliminate as burnin. Defaults to zero.}

\item{window.size}{The number of trees to include in each window.}

\item{gens.per.tree}{The number of steps in the MCMC chain corresponding to a tree in the tree list. Defaults to 1.}
}
\value{
rwty.slide An object containing the frequencies of clades in the sliding
windows, a translation table that converts clade groupings to factors, and a plot.
}
\description{
This function takes sliding windows of a specified length over an MCMC chain
and calculates the posterior probability of clades within that window.  It
allows users to see whether the chain is visiting different areas of treespace.
}
\examples{
data(fungus)
slide.data <- slide.freq(fungus$Fungus.Run1$trees, burnin=20, window.size=20, gens.per.tree=10000)
}
\keyword{MCMC,}
\keyword{convergence}
\keyword{posterior}
\keyword{probability,}

