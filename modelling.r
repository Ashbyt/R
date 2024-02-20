
#https://www.kaggle.com/code/leolcling/visualizing-iris-datasets-with-r-ggplot2
data(iris)
head(iris)
require(ggplot2)
qplot(Sepal.Length, Petal.Length, data = iris,
color = Species)
