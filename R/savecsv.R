#' Save Csv Files
#'
#' @param dataset Data to be saved as csv
#' @param filename Name chosen by the user for csv file
#' @param row.names Parameter to omit the row names
#' @param ... Other parameters
#'
#' @return a csv file
#' @export
#' @import assertthat
#' @importFrom utils write.csv2
#'
#' @examples
#' \dontrun{
#' save_as_csv(dataname, my_csv_file_name, row.names=FALSE)
#' }
#'
save_as_csv <- function(dataset, filename, row.names = FALSE, ...) {
  assert_that(has_extension(filename,"csv"))
  assert_that(is.dir(dirname(filename)))
  assert_that(is.writeable(dirname(filename)))
  assert_that(not_empty(dataset))
  assert_that(is.data.frame(dataset))
  write.csv2(x = dataset, file = filename, row.names = row.names, ...)
  invisible(normalizePath(filename))
}
