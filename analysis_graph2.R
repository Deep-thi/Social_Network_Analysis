### Lab 1: Read a social network dataset and make a graph
### Source of dataset: http://networkrepository.com/soc-karate.php

# Read data ---------------------------------------------------------------

setwd("C:/Users/User/OneDrive/Documents/social_network_analysis")

# read data from the .csv file
graph2 <- read.csv("graph2.csv")
graph2 <- as.matrix(graph2)
# show the data in Console
graph2

# Load igraph and create a network object ---------------------------------

# load the library
library(igraph)
# create a network/graph object
g <- graph_from_edgelist(graph2, directed = FALSE)
# show the graph in console
g


# Plot the graph ----------------------------------------------------------

# plot using the default layout
plot(g)
library(netrankr)
#degree_centrality
g %>% 
  indirect_relations(type="adjacency") %>% 
  aggregate_positions(type="sum")
#Closeness
g %>% 
  indirect_relations(type="dist_sp") %>% 
  aggregate_positions(type="invsum")
#Betweenness Centrality
g %>% 
  indirect_relations(type="depend_sp") %>% 
  aggregate_positions(type="sum")
#Eigenvector Centrality
g %>% 
  indirect_relations(type="walks",FUN=walks_limit_prop) %>% 
  aggregate_positions(type="sum")
#subgraph centrality
g %>% 
  indirect_relations(type="walks",FUN=walks_exp) %>% 
  aggregate_positions(type="self")
#communicability centrality
g %>% 
  indirect_relations(type="walks",FUN=walks_exp) %>% 
  aggregate_positions(type="sum")
#odd subgraph centrality
g %>% 
  indirect_relations(type="walks",FUN=walks_exp_odd) %>% 
  aggregate_positions(type="self")
#even subgraph centrality
g %>% 
  indirect_relations(type="walks",FUN=walks_exp_even) %>% 
  aggregate_positions(type="self")
library(sna)
library(dplyr)
#information_centrality
infocent <- sna::infocent(get.adjacency(g,sparse=F))
glimpse(infocent)
#alpha_centrality
alpha_centrality(g)
power_centrality(g)
page_rank(g)
library(centiserve)
katzcent(g)
bottleneck(g)
library(linkcomm)
communitycent(g)
#laplacian centrality
laplacian(g)
