#' New style plotting of cumulative and slide objects
#' 
#' Takes a table from cumulative.freq or slide.freq as input.  
#' Numclades gives the number of clades to plot, starting from the
#' top.  Since cumulative.freq and slide.freq both sort by sd these
#' will by default be the most variable clades.
#'
#' @param input.table An rwty.slide or rwty.cumulative object 
#' @param numclades The number of clades to plot.  The clades with the highest sd in clade frequency are plotted first, so numclades = 10 will be the 10 most variable clades in the chain. 
#'
#' @return thisplot Returns a ggplot object.
#'
#' @keywords cumulative, sliding window, mcmc, phylogenetics, plot
#'
#' @export makeplot.cladeprobs
#' @examples
#' data(fungus)
#' slide.data <- slide.freq(fungus$Fungus.Run1$trees, burnin=20, window.size=20, gens.per.tree=10000)
#' makeplot.cladeprobs(input.table = slide.data$slide.table, numclades=25)

makeplot.cladeprobs <- function(input.table, numclades=20){ 
    # clade probability plot over generations
    
    # TODO should put a check in here to make sure it only accepts slidetest or cumtest objects
    
    x <- input.table[1:numclades,2:length(input.table) - 2] #Stripping off mean and SD
    x$clade <- rownames(x)
    x <- melt(x, id.vars="clade")
    colnames(x) <- c("Clade", "Generations", "Posterior.Probability")
    #print(x$Generations)
    x$Clade <- as.factor(x$Clade)
    
    #print(x)
    thisplot <- ggplot(data=x, aes(x=as.numeric(as.character(Generations)), y=Posterior.Probability, group=Clade, color=Clade)) + 
        geom_line() +
        theme(legend.position="none") +
        xlab("Generations") +
        theme(axis.title.x = element_text(vjust = -.5), axis.title.y = element_text(vjust=1.5))
    thisplot
}