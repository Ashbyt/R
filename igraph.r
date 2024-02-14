#basic graphs
library(igraph)
g <- graph.formula(1-2, 1-3, 2-3, 2-4) # the connections, 1 to 2, 1 to 3 etc.
# or g <- graph(c(1,2,1,3,2,3,2,4), directed = FALSE)
#Edges also 4
E(g) #
#What is the diameter of this graph?
diameter(g)
#Name them if you like
V(g)$name <- c("Adam", "Bob", "Con", "Doug")
# and replot using $name
plot(g, vertex.label = V(g)$name) # add labels
get.adjacency(g) # a matrix view

#Directed Graphs
create a 'dg' (directed graph)
dg <- graph.formula(1-+2, 1-+3, 2-+3, 2-+4) # so '1' owes '2' & '3' etc.
#plot(dg, vertex.label = V(dg))
#and display
plot(dg)

