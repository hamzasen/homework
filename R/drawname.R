#' Plot the evolution of a name given in France
#'
#' @param the_name Name to look up
#' @param the_sex Sex of the name
#'
#' @return a graphic
#' @export
#' @import ggplot2 tidyr dplyr dygraphs prenoms assertthat
#' @examples
#' \dontrun{
#' draw_a_name("Hamza","M")
#' }
#'
draw_a_name <- function(the_name,the_sex){
  assert_that(is.character(the_name))
  assert_that(the_sex %in% c("F","M"))
  base <- prenoms::prenoms %>%
    filter(name == the_name & sex == the_sex) %>%
    group_by(year) %>%
    summarize(total=sum(n))

  ggplot(data = base, aes(x = year, y = total)) +
    geom_line()
}
