
# ghe.utils

<!-- badges: start -->
[![R-CMD-check](https://github.com/ddsjoberg/ghe.utils/workflows/R-CMD-check/badge.svg)](https://github.com/ddsjoberg/ghe.utils/actions)
![runiverse-package](https://ddsjoberg.r-universe.dev/badges/ghe.utils)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of {ghe.utils} is to make it easier to work with an Enterprise instance of GitHub (GHE).
The package includes functions for setting a GHE PAT, installing packages from GHE, connect a local repo to GHE, and more.

Follow the instructions below to get started.

### Installation

```r
install.packages("ghe.utils", repos = c(ddsjoberg = 'https://ddsjoberg.r-universe.dev', getOption("repos")))
```

### Using the {ghe.utils} Package

#### 1. Set GHE Location

After you install the {ghe.utils} package, you can use the functions only after the location of the GHE has been set.
You can set the location with either an environmental variable or an option.
Add the GHE address on an environmental variable by calling `usethis::edit_r_environ()` to open the environmental variables file, then adding the host location.

  ```r
  GHE_HOST=<GHE Address>
  ```

You can add the host location option to your `.Rprofile`.
Open the file with `usethis::edit_r_profile()`, and add the following line.
  
  ```r
  options(ghe_host = "<GHE Address>")
  ```
  
#### 2. Use {ghe.utils} as a Dependency

If you prefer not to set the GHE host location, you can write your own package that wraps the functions in {ghe.utils}.
For example, you can export a new function to install packages from you GHE instance.
Wrap the {ghe.utils} function in `withr::with_envvar()` to temporarily set the `"GHE_HOST"` environmental variable.

  ```r
  #' Install Package from GHE
  #'
  #' @inheritParams ghe.utils::install_ghe
  #' @export
  install_github_my_company <- function(repo, ...) {
    withr::with_envvar(
      new = c(GHE_HOST = "<GHE Address>"),
      code = ghe.utils::install_ghe(repo = repo, ...)
    )
  }
  ```

If you opt for this option, you'll need to add the following line to the `DESCRIPTION` file to depend on the {ghe.utils} package.

  ```
  Additional_repositories: https://ddsjoberg.r-universe.dev
  ```

### Other Options

The {ghentr} project seeks to solve similar issues working with a GitHub Enterprise instance, and offers another approach.
Details at [https://ijlyttle.github.io/ghentr/](https://ijlyttle.github.io/ghentr/).
