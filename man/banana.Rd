% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/banana.R
\name{banana}
\alias{banana}
\title{banana}
\usage{
banana(a, b, r)
}
\arguments{
\item{a}{Input parameter \eqn{a} defined above}

\item{b}{Input parameter \eqn{b} defined above}

\item{r}{Input parameter \eqn{r} defined above}
}
\value{
list with functions \code{target}, \code{grad}, and \code{sample}
}
\description{
Let \eqn{(u, v)} be distributed bivariate normal with mean 0 and correlation \eqn{r}
and let \eqn{(x, y)} be distributed banana with \deqn{x = u a} and \deqn{y = v/a + b (u^2 + a^2).}
}
\details{
This function takes \eqn{a}, \eqn{b}, and \eqn{r} as inputs and returns a
list containing a function to evaluate the PDF of this distribution,
a function to evaluate the gradient of this distribution, and a
function to draw random samples from this distribution.
}
\examples{
ban <- banana(a = 1.25, b = .5, r = .95)
xy <- ban$sample(1000)
plot(xy)
z <- ban$target(xy[,1], xy[,2])
# Show the density
library(ggplot2)
xyz <- as.data.frame(cbind(xy, z))
ggplot(xyz, aes(x, y, alpha = z)) + geom_point(colour = 'black')
# Simulate Hamiltonian behavior starting at 0 with step size .06
f <- function(g){ .06 * ban$grad(g[1], g[2])}
path <- matrix(0, ncol = 2, nrow = 40)
for (i in 1 + seq_len(39)) {
  path[i,] <- path[i-1,] + f(path[i-1,])
}
ggplot(NULL, aes(x, y)) +
  geom_point(aes(alpha = z), data = xyz, colour = 'black', show.legend = FALSE) +
  geom_path(aes(x = path[,1], y = path[,2], alpha = 1), data = NULL, colour ='red', show.legend = FALSE) +
  coord_cartesian(xlim = c(-1, .1), ylim = c(-.1, 1))
}
