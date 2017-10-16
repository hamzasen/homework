#' Draw a plot comparing the evolutions of multiple names in France
#'
#' @param vector_name vector of the names to be plotted
#'
#' @return a plot
#' @export
#' @import ggplot2 tidyr dplyr dygraphs prenoms
#' @examples
#' \dontrun{
#' mdrawnames(c("Hamza", "Alex", "Raphael"))
#' }
mdrawnames <- function(vector_name){
  base <- prenoms::prenoms %>%
    filter(name %in% vector_name) %>%
    group_by(name, year) %>%
    summarize(total=sum(n))

  ggplot(data = base, aes(x = year, y = total, colour = name)) +
    geom_line()
}
