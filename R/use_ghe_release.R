#' Make GHE Release
#'
#' @param name Name of GHE release
#' @param append_date Logical indicating whether to append the date to the
#' release name.
#'
#' @return NULL
#' @export
use_ghe_date_release <- function(name = "<release annotation>", append_date = TRUE) {
  # extracting repo name and owner name ----------------------------------------
  if (is.null(ghe_host())) return(invisible())
  origin_address <- usethis::git_remotes()$origin
  repo_name <- basename(origin_address)
  repo_name <- gsub(pattern = ".git$", replacement = "", x = repo_name)
  owner <- gsub(pattern = paste0(basename(origin_address), "$"),
                replacement = "",
                x = origin_address)
  owner <- basename(owner)

  # making release -------------------------------------------------------------
  gh::gh("POST /repos/:owner/:repo/releases",
         owner = owner,
         repo = repo_name,
         tag_name = Sys.Date(),
         target_commitish = usethis::git_default_branch(),
         name = ifelse(append_date, paste(name, Sys.Date()), name),
         body = NULL,
         draft = TRUE,
         .api_url = paste0(ghe_host(), "/api/v3"),
         .token = ghe_token())
}
