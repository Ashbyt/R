data(iris)
head(iris)
require(ggplot2)
qplot(Sepal.Length, Petal.Length, data = iris,
color = Species)
