#' Make autocorrelation plots of tree topologies from MCMC analyses
#' 
#' This function takes a list of rwty.trees objects, and makes an
#' autocorrelation plot for each chain. Each plot shows the median phylogenetic
#' distance at a series of sampling intervals. In really well behaved MCMC 
#' analyses, the median distance will stay constant as the sampling interval 
#' increases. If there is autocorrelation, the median distance will 
#' increase as the sampling interval increases, and is expected to level
#' off when the autocorrelation decreases to zero. The function calculates
#' path distances, though other distances could also be employed.
#'
#' @param chains A list of rwty.trees objects. 
#' @param burnin The number of trees to eliminate as burnin.
#' @param autocorr.intervals The maximum number of sampling intervals to use.
#' @param squared TRUE/FALSE use squared tree distances (necessary to calculate approximate ESS; default FALSE)
#' @param ac.cutoff The proportion of the estimated asymptotic path distance to use as a cutoff for estimating minimum sampling interval.  For instance, if ac.cutoff = 0.9, the sampling interval returned will be the minimum sampling interval necessary to achieve a path distance of 0.9 times the estimated asymptotic value.
#' @param facet TRUE/FALSE to turn facetting of the plot on or off (default FALSE)
#'
#' @return A ggplot2 plot object, with one line (facetting off) or facet
#' (facetting on) per rwty.trees object.
#'
#' @keywords autocorrelation, path distance
#'
#' @export makeplot.autocorr
#' @examples
#' data(fungus)
#' makeplot.autocorr(fungus, burnin = 20)

makeplot.autocorr <- function(chains, burnin = 0, autocorr.intervals = 100, squared = FALSE, ac.cutoff = 0.95, facet = FALSE){

    chains = check.chains(chains)

    dat <- topological.autocorr(chains, burnin, autocorr.intervals, squared = squared)

    if(squared == TRUE){
        y.label = "median squared topological distance"
    }else{
        y.label = "median topological distance"
    }

    autocorr.plot = ggplot(data=dat, aes(x=sampling.interval, y=topo.distance)) + 
            geom_line(alpha=0.2, aes(colour = chain)) + geom_point(size = 2, aes(colour = chain)) + 
            xlab("sampling interval") + ylab(y.label) + 
            theme(axis.title.x = element_text(vjust = -.5), axis.title.y = element_text(vjust=1.5))

    if(facet) autocorr.plot = autocorr.plot + facet_wrap(~chain, ncol=1) + theme(legend.position="none")
    
    autocorr.plot <- list(autocorr.plot = autocorr.plot)
    
    return(autocorr.plot)
    
}
