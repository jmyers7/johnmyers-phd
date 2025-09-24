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

# sigma <- sqrt(as.numeric(weights %*% second.moments - (weights %*% means) ** 2) / n.sample)
# components <- sample(
#   1:n.components,
#   size = n.replicates * n.sample,
#   replace = TRUE,
#   prob = weights
# )

# boot.sample <- matrix(
#   rnorm(n.replicates * n.sample, mean = means[components], sd = sds[components]),
#   nrow = n.replicates,
#   ncol = n.sample
# )

# sample.dist <- rowMeans(boot.sample)


plot.sampling.dist <- function(df.sample,
  n.sample,
  mu, sigma,
  bins = 50,
  alpha = 0.5) {
  
  ggplot(df.sample, aes(x = xbar)) +
    geom_histogram(
      aes(y = after_stat(density)),
      color = grey,
      bins = bins,
      alpha = alpha,
      fill = yellow
    ) +
    stat_density(
      aes(color = "data"),
      geom = "line",
      linewidth = 1
    ) +
    stat_function(
      aes(color = "normal"),
      fun = function(x) dnorm(x, mean = mu, sd = sigma),
      linewidth = 1   
    ) + 
    scale_color_manual(
      name = NULL,
      values = c("data" = yellow, "normal" = blue)
    ) +
    labs(
      x = TeX("$\\bar{x}$"),
      title = TeX(paste0("sampling distribution for $\\bar{X}_{", n.sample, "}$"))
    )
}