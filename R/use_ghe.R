#' Connect a local repo with GitHub Enterprise
#'
#' Function in a wrapper for `usethis::use_github()` with the GitHub Enterprise
#' instance.
#'
#' @inheritDotParams  usethis::use_github -host -auth_token -credentials
#'
#' @export
#' @seealso Review [`usethis::use_github()`] for details.

use_ghe <- function(...) {
  usethis::use_github(..., host = ghe_host())
}
