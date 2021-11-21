#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

`%||%` <- function (x, y) {
  if (is.null(x)) y
  else x
}
