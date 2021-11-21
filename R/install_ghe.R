#' Install a package directly from GitHub Enterprise.
#'
#' @inheritParams remotes::install_github
#' @inheritDotParams  remotes::install_github -host -auth_token
#' @seealso [remotes::install_github()]
#' @export
#' @author Daniel D. Sjoberg

install_ghe <- function(repo, ...) {
  remotes::install_github(
    repo,
    auth_token = ghe_token(),
    host = ghe_host(),
    ...
  )
}
