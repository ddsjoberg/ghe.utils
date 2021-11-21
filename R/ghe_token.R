#' Retrieve GH Enterprise Personal Access Token (PAT)
#'
#' Functions for setting up a GHE PAT (`create_ghe_token()`),
#' and accessing the saved PAT (`ghe_token()`).
#'
#' @inheritParams usethis::create_github_token
#' @name token
NULL


#' @export
#' @rdname token
ghe_token <- function() {

  # try to get MSK PAT stored with gitcreds
  token <-
    tryCatch(
      gh::gh_token(api_url = ghe_host()),
      error = function(e) {
        cli::cli_alert_danger("There was an error retrieving your GitHub Enterprise PAT.")
        return(invisible())
      }
    )

  class(token) <- "gh_pat"
  token
}

#' @export
#' @rdname token
create_ghe_token <- function(scopes = c("repo", "user", "gist", "workflow")) {

  usethis::create_github_token(
    scopes = scopes,
    description =
      getOption("ghe_pat_name") %||%
      Sys.getenv("ghe_pat_name") %||%
      "R:GITHUB_ENTERPRISE_PAT",
    host = ghe_host()
  )
}
