#' Check for GHE Network Access
#'
#' @return logical
#' @author Daniel D. Sjoberg
#' @export
#'
#' @examplesIf FALSE
#' has_ghe_network_access()

has_ghe_network_access <- function() {
  # if the GHE GitHub site is accessible, return TRUE
  !is.null(curl::nslookup(ghe_host(), error = NULL))
}
