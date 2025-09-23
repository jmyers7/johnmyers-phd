library("ggplot2")
library("dplyr")
library("latex2exp")
source("../../aux-files/custom-theme.R")
set.seed(42)
yellow <- custom_colors[["yellow"]]
blue <- custom_colors[["blue"]]
pink <- custom_colors[["pink"]]
grey <- custom_colors[["grey"]]

theme_set(custom_theme())

meanlog <- 1
sdlog <- 0.75
n.samples <- 10
n.replicates <- 1000

bootstrap.samples <- matrix(
  rlnorm(n = n.samples * n.replicates, meanlog = meanlog, sdlog = sdlog),
  nrow = n.replicates,
  ncol = n.samples
)

xbars <- data.frame(xbar = rowMeans(bootstrap.samples))

ggplot(xbars, aes(x = xbar)) +
  geom_histogram(
    aes(y = after_stat(density)),
    fill = yellow,
    color = grey,
    bins = 50,
    alpha = 0.5
  ) +
  stat_function(
    fun = function(x) dlnorm(x, meanlog = meanlog, sdlog = sdlog),
    color = blue,
    n = 200
  ) +
  xlim(0, 13)

ggplot(xbars, aes(x = xbar)) +
  stat_density(
    geom = "line",
    color = yellow
  )
