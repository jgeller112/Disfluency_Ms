#' Reparameterized ex-Gaussian model for brms
#'
#' Defines a custom family where `mu` is the mean of the normal component (not the overall mean).
#' This matches conventions in the RT modeling literature.
#'
#' @param link_mu,link_sigma,link_beta Link functions for the distribution parameters.
#' @return A `brms::custom_family` object
#' @export
#' 
#' 
#' 
three_param_exgauss <- function(link_mu = "identity", link_sigma = "log", link_beta = "log") {
  brms::custom_family(
    name = "exp_mod_normal2",
    dpars = c("mu", "sigma", "beta"),
    links = c(link_mu, link_sigma, link_beta),
    lb = c(NA, 0, 0),
    type = "real"
  )
}

three_param_exg_funs <- "
  real exp_mod_normal2_lpdf(real Y, real mu, real sigma, real beta) {
    return exp_mod_normal_lpdf(Y | mu, sigma, inv(beta));
  }
"

# `stanvars` prepared `standard_exg_funs` to be added to the stan code
three_param_exg_stanvars <- stanvar(scode = three_param_exg_funs, block = "functions")

