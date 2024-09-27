#' Apply normalization based on CITPC MJ Map
#' @name show_cluster
#' @description Transform (normalize) a string for VIAF comparisons.
#' @usage show_cluster(chr, communities)
#' @param chr A character 
#' @param graph An igraph graph object, corresponding to communities
#' @param communities A communities object, the result of an igraph community detection function
#'   such as [igraph::cluster_walktrap()].
#' @import stringi
#' @import dplyr
#' @import magrittr
#' @import tidygraph
#' @export
show_cluster <- function(chr, graph, communities, translitrules = NULL, ...){
    library(tidygraph)
    vnames <- stringi::stri_trans_general(chr, id="Any-Hex/Unicode") %>%
                stringi::stri_replace_first_fixed('U+','') %>% tolower()
    print(vnames)
    clustpick <- tibble(ucs=V(graph)$name, edges=as.integer(degree(graph, mode="all")),
			    membership=membership(communities))

    clust <- clustpick %>% mutate(mem = as.integer(membership)) %>% filter(ucs %in% vnames)
    if(nrow(clust) == 0) return(NULL)

    roster <- clustpick %>% mutate(mem = as.integer(membership)) %>% 
	            filter(mem == clust$mem) %>% select(ucs)

    graph_tidy <- as_tbl_graph(graph) %>% 
                activate(nodes) %>% 
                filter(name %in% as.character(roster$ucs))

    lbls <- unlist(ifelse(is.null(translitrules), NULL, .get_labels(roster,translitrules )))

    plot.igraph(graph_tidy, vertex.label = lbls)

    graph_tidy %>% activate(edges) %>% print(n=Inf)
    graph_tidy %>% activate(nodes) %>% print(n=Inf)
}

.get_labels <- function(roster, translitrules){
    rosterhex <- roster %>% mutate(ucs = as.hexmode(paste0("0x",ucs,sep="")))
    labels <- translitrules %>% filter(ucs %in% rosterhex$ucs) %>%
                mutate(lbl = paste0(from,"\n",as.character(ucs), sep="") ) %>% 
                select(lbl)
    return(labels)
}