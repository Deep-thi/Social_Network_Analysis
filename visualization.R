setwd("C:/Users/User/OneDrive/Documents/social_network_analysis/assignment")
# read data from the .csv file
graph2 <- read.csv("graph2.csv")
graph2 <- as.matrix(graph2)
# show the data in Console
graph2
library(igraph)
# create a network/graph object
g <- graph_from_edgelist(graph2, directed = FALSE)
# show the graph in console
g
plot(g)

library(CINNA)
visualize_graph( g , centrality.type="Degree Centrality")
visualize_graph( g , centrality.type="Information Centrality")
visualize_graph( g , centrality.type="Barycenter Centrality")
visualize_graph( g , centrality.type="Entropy Centrality")
visualize_graph( g , centrality.type="Laplacian Centrality")
