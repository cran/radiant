## ----echo = FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
suppressMessages(library(radiant))
knitr::opts_chunk$set(comment=NA, cache=FALSE, message=FALSE, warning=FALSE)
data("diamonds")
data("salary")
data("shopping")

## ----eval = FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  help(package = radiant.data)
#  help(package = radiant.design)
#  help(package = radiant.basics)
#  help(package = radiant.model)
#  help(package = radiant.multivariate)

## ----fig.height=3, fig.width=5------------------------------------------------------------------------------------------------------------------------------------------------------------------------
result <- single_mean(diamonds, "price")
summary(result)
plot(result)

## ----fig.height=4, fig.width=5------------------------------------------------------------------------------------------------------------------------------------------------------------------------
visualize(diamonds, xvar = "carat", yvar = "price", type = "scatter",
          facet_row = "clarity", color = "clarity")

## ----fig.height=6, fig.width=5------------------------------------------------------------------------------------------------------------------------------------------------------------------------
result <- single_mean(mtcars, "mpg", comp_value = 20, alternative = "greater")
summary(result)
plot(result, plots = c("hist","simulate"))

## ----fig.height=5, fig.width=4------------------------------------------------------------------------------------------------------------------------------------------------------------------------
result <- compare_means(diamonds, "clarity", "price")
summary(result)
plot(result, plots = c("bar","density"))

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
result <- compare_means("salary", "rank", "salary")
summary(result)
plot(result)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
result <- regress(diamonds, "price", c("carat","clarity"))
summary(result, sum_check = "confint")
predict(result, pred_cmd = "carat = 1:10")
plot(result, plots = "coef")

## ----fig.width=5, fig.height=7------------------------------------------------------------------------------------------------------------------------------------------------------------------------
plot(result, plots = "dashboard")

## ----fig.width = 4, fig.height=5----------------------------------------------------------------------------------------------------------------------------------------------------------------------
## load the radiant library (not needed if run in Radiant's R > Code tab)
library(radiant.multivariate)

## load the data
data("shopping")

## run hierarchical cluster analysis on the shopping data, variables v1 through v6
result <- hier_clus(shopping, "v1:v6")

## summary - not much here - plots are more important
summary(result)

## check the help file on how to plot results from hierarchical cluster analysis
## default plots - looks like there is a big jump in overall within-cluster
## heterogeneity in the step from 3 to 2 segments
plot(result)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## show the dendrogram with cutoff at 0.1
plot(result, plots = "dendro", cutoff = 0.1)

## ----fig.width=5, fig.height=6------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## plots created above suggest 3 clusters may be  most appropriate
## use kmeans to create the clusters
## generate output and save clustermembership to the datafile
result <- kmeans_clus(shopping, vars = "v1:v6", nr_clus = 3)
summary(result)
plot(result)
shopping <- store(result)

## was the data really changed?
head(shopping)

