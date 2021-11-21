
# ghe.utils

<!-- badges: start -->
[![R-CMD-check](https://github.com/ddsjoberg/ghe.utils/workflows/R-CMD-check/badge.svg)](https://github.com/ddsjoberg/ghe.utils/actions)
![runiverse-package](https://ddsjoberg.r-universe.dev/badges/ghe.utils)
<!-- badges: end -->

The goal of {ghe.utils} is to make it easier to work with an Enterprise instance of GitHub (GHE).
The package includes functions for setting a GHE PAT, installing packages from GHE, connect a local repo to GHE, and more.

Follow the instructions below to get started.

#### 1. Installation

```r
install.packages("ghe.utils", repos = c(ddsjoberg = 'https://ddsjoberg.r-universe.dev', getOption("repos")))
```

#### 2. Set GHE Location

Set the location on your GHE instance with either an option or environmental variable.
You can add the option to your `.Rprofile`.
Open the file with `usethis::edit_r_profile()`, and add the following line.

  ```r
  options(ghe_host = "<GHE Address>")
  ```

You can choose to add the GHE address on an environmental variable as well with `usethis::edit_r_environ()`.

  ```r
  ghe_host=<GHE Address>
  ```
