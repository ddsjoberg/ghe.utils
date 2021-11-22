#' Retrieve GH Enterprise Location
#'
#' @export

ghe_host <- function() {
  host <- getOption("ghe_host") %||% Sys.getenv("ghe_host")
  host <- switch(host != "", host)

  # check if GHE Host location has been set ------------------------------------
  if (is.null(host)) {
    cli::cli_alert_danger(
      paste("GHE Host is not specified in {.code options(ghe_host=)}",
            "or the {.code ghe_host} envorinmental variable.",
            "Set the v, and try again.")
    )
  }

  host
}

