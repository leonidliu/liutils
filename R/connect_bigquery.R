#' Establish BigQuery connection
#'
#' Function to establish a BigQuery database connection.
#'
#' @param project BQ project ID
#' @param billing BQ project ID
#' @param dataset BQ dataset
#'
#' @export

connect_bigquery <-

  function(project = Sys.getenv("BQ_PROJECT_ID"),
           billing = Sys.getenv("BQ_PROJECT_ID"),
           dataset = Sys.getenv("BQ_DATASET")) {

    DBI::dbConnect(bigrquery::bigquery(),
                   project = project,
                   billing = billing,
                   dataset = dataset)

  }
