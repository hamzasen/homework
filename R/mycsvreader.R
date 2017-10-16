#' Import the csv files from a given folder
#'
#' @param folder path of the folder to import
#'
#' @return a list
#' @export
#' @import assertthat
#' @importFrom utils read.csv2
#' @examples
#' \dontrun{
#' my_csv_reader(".../path")
#' }
#'
mycsvreader <- function(folder){
  assert_that(is.dir(folder))
  l <- list.files(path = folder, pattern =".csv$", full.names = TRUE)
  result <- lapply(l,read.csv2)
  return(result)
}
