#' @title Continuous colour scales using the dhsc_cols palette
#'
#' @description \code{scale_dhsc_continuous} takes dhsc_green and varies 
#'
#' @param type sets whether the scale applies to (line) \code{colour}, the
#' \code{fill} colour, or \code{both}.
#' 
#' @param ... additional arguments to be supplied to the underlying ggplot2
#' \code{scale_} function.
#' 
#' @return Will not return anything of itself, but when used in conjuntion
#' with \code{\link{ggplot}} and (e.g.) \code{\link{geom_col}} from the
#' package \code{ggplot2}, will apply a colour scale to a plot.
#' 
#' @examples 
#' 
#' library(ggplot2)
#' library(govstyle)
#' library(dplyr)
#' 
#' df <- data.frame(
#'     year = c(2009, 2010, 2011, 2009, 2010, 2011),
#'     price = c(35, 37, 36, 24, 25, 28))
#' 
#' # Column chart
#' ggplot(df, aes(x = year, y = price, fill = year)) +
#'    geom_col(position = "dodge") +
#'    theme_gov() +
#'    scale_dhsc_continuous("fill")
#'
#' # Line chart
#' ggplot(df, aes(x = year, y = price, colour = year)) +
#'    geom_line(size = 2) +
#'    theme_gov() +
#'    scale_dhsc_continuous("colour")
#'
#' # Point chart, with filled points (black outline)
#' ggplot(df, aes(x = year, y = price, colour = year)) +
#'    geom_line() +
#'    geom_point(shape = 21, size = 4, stroke = 1, fill = "#ffffff") +
#'    theme_gov() +
#'    scale_dhsc_continuous("colour") +
#'    ylim(0,40)
#'
#' @export
#' 

scale_dhsc_continuous <- function(type = "fill", ...) {
  
  type = match.arg(type, c("colour", "fill"))
  
  base_colour <- unname(dhsc_cols["deep_purple"])
  low_colour <- col2rgb(base_colour) %>%
    rgb2hsv()
  
  low_colour <- hsv(low_colour[1], 0.2 * low_colour[2], low_colour[3])
  
  
  if (type == "fill") {
    s <- ggplot2::scale_fill_gradient(low=low_colour, high=base_colour)
  } else if (type == "colour") {
    s <- ggplot2::scale_coloru_gradient(low=low_colour, high=base_colour)
  }
  
  return(s)
  
}
