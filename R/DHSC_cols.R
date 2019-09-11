#' @title A vector of the DHSC approved colours
#'
#' @description \code{\link{dhsc_cols}} Provides a vector of named colours
#' from the approved gov.uk colour list available \url{here}.
#'
#' @return A list of named hexadecimal colours.
#'
#' @examples
#'
#' library(ggplot2)
#' library(govstyle)
#' library(dplyr)
#'
#' mtcars %>%
#'   ggplot() +
#'   aes(
#'     x = mpg,
#'     y = wt
#'   ) +
#'   geom_point(
#'     colour = gov_cols["green"]
#'   ) +
#'   theme_gov()
#' @export
#'

dhsc_cols <- c(
  cool_grey = "#616265",
  red = "#cc092f",
  orange = "#e57200",
  maroon = "#8b2346",
  cyan = "#34b6e4",
  deep_blue = "#0063be",
  light_green = "#2eb135",
  deep_green = "#006652",
  yellow = "#ecac00",
  purple = "#cd66cc",
  deep_purple = "#512698",
  dhsc_green = "#00ad93"
)
