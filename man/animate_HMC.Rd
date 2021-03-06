% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hmc_animation.R
\name{animate_HMC}
\alias{animate_HMC}
\title{animate_HMC}
\usage{
animate_HMC(b, epsilon, n_steps, n_samples, start_q, start_p,
  force_reject = FALSE)
}
\arguments{
\item{b}{An object representing a banana-shaped distribution}

\item{epsilon}{HMC step size}

\item{n_steps}{Number of HMC leapfrog integration steps}

\item{n_samples}{Number of MCMC samples}

\item{start_q}{Starting position (parameter value)}

\item{start_p}{Starting momentum (random noise)}

\item{force_reject}{I can't remember what this does}
}
\value{
A list with a ggplot object and a data frame
}
\description{
animate_HMC
}
