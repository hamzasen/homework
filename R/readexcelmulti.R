
#'Import all sheets from an excel file (xlsx)
#'
#' @param file Path to the excel file to be loade
#' @import readxl assertthat
#' @return a list
#' @export
#'
#' @examples
#' \dontrun{
#' read_excel_multi(".../path/file.xlsx")
#' }
#'
read_excel_multi <- function(file) {
  assert_that(is.dir(dirname(file)))
  assert_that(has_extension(file,"xlsx"))
  all_sheets <- readxl::excel_sheets(file)
  result <- lapply(all_sheets, function(sheet) {
    readxl::read_excel(file, sheet = sheet)
  })
  return(result)
}
