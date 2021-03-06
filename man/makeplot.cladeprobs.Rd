% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/makeplot.cladeprobs.R
\name{makeplot.cladeprobs}
\alias{makeplot.cladeprobs}
\title{New style plotting of cumulative and slide objects}
\usage{
makeplot.cladeprobs(input.table, numclades = 20)
}
\arguments{
\item{input.table}{An rwty.slide or rwty.cumulative object}

\item{numclades}{The number of clades to plot.  The clades with the highest sd in clade frequency are plotted first, so numclades = 10 will be the 10 most variable clades in the chain.}
}
\value{
thisplot Returns a ggplot object.
}
\description{
Takes a table from cumulative.freq or slide.freq as input.  
Numclades gives the number of clades to plot, starting from the
top.  Since cumulative.freq and slide.freq both sort by sd these
will by default be the most variable clades.
}
\examples{
data(fungus)
slide.data <- slide.freq(fungus$Fungus.Run1$trees, burnin=20, window.size=20, gens.per.tree=10000)
makeplot.cladeprobs(input.table = slide.data$slide.table, numclades=25)
}
\keyword{cumulative,}
\keyword{mcmc,}
\keyword{phylogenetics,}
\keyword{plot}
\keyword{sliding}
\keyword{window,}

