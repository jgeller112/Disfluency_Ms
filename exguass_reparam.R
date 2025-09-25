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
three_param_exgauss <- function(
  link_mu = "identity",
  link_sigma = "log",
  link_beta = "log"
) {
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
three_param_exg_stanvars <- stanvar(
  scode = three_param_exg_funs,
  block = "functions"
)

#' @rdname three_param_exgauss
#' @export
log_lik_exp_mod_normal2 <- function(i, prep) {
  y <- prep$data$Y[i]
  if (is.na(y)) {
    return(NA_real_)
  }

  mu <- brms::get_dpar(prep, "mu", i)
  sigma <- brms::get_dpar(prep, "sigma", i)
  beta <- brms::get_dpar(prep, "beta", i)

  n_draws <- length(mu)
  if (n_draws == 0) {
    return(numeric(0))
  }
  y_vec <- rep(y, length.out = n_draws)

  # Compute log-likelihood manually (no base R function exists for exgauss)
  lambda <- 1 / beta
  z <- (y_vec - mu) / sigma
  t <- lambda * sigma - z
  log_phi <- dnorm(z, log = TRUE)
  log_Phi <- pnorm(t, log.p = TRUE)

  ll <- log(lambda) -
    lambda * (y_vec - mu) +
    0.5 * (lambda^2) * (sigma^2) +
    log_Phi

  # Catch invalid parameter combinations
  ll[sigma <= 0 | beta <= 0] <- -Inf
  ll[is.nan(ll) | is.na(ll)] <- -Inf
  ll
}

#' @rdname three_param_exgauss
#' @export
posterior_epred_exp_mod_normal2 <- function(prep) {
  mu <- brms::get_dpar(prep, "mu")
  beta <- brms::get_dpar(prep, "beta")
  epred <- mu + beta

  epred[beta <= 0] <- NA_real_
  epred
}

#' @rdname three_param_exgauss
#' @export
posterior_predict_exp_mod_normal2 <- function(i, prep, ...) {
  mu <- brms::get_dpar(prep, "mu", i)
  sigma <- brms::get_dpar(prep, "sigma", i)
  beta <- brms::get_dpar(prep, "beta", i)

  n_draws <- length(mu)

  # Avoid invalid draws
  sigma[sigma <= 0] <- .Machine$double.eps
  beta[beta <= 0] <- .Machine$double.eps

  normal_part <- stats::rnorm(n_draws, mean = mu, sd = sigma)
  exp_part <- stats::rexp(n_draws, rate = 1 / beta)
  y_sim <- normal_part + exp_part

  as.matrix(y_sim)
}
