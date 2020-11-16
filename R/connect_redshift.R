#' Establish Redshift connection
#'
#' Function to establish an Amazon Redshift database connection.
#'
#' @param dbname database name
#' @param host databse host
#' @param port database host
#' @param user database username
#' @param password database password
#'
#' @references
#' Connects to Redshift using the recommendation from
#' [this guide](https://blog.datascienceheroes.com/a-comprehensive-guide-to-connect-r-to-amazon-redshift/).
#' Importantly, it uses RPostgres, as opposed to RJDBC.
#'
#' @export
connect_redshift <-

  function(dbname = Sys.getenv('REDSHIFT_DATABASE'),
           host = Sys.getenv('REDSHIFT_HOST'),
           port = Sys.getenv('REDSHIFT_PORT'),
           user = Sys.getenv('REDSHIFT_CREDENTIAL_USERNAME'),
           password = Sys.getenv('REDSHIFT_CREDENTIAL_PASSWORD')) {

    DBI::dbConnect(RPostgres::Postgres(),
                   dbname = dbname,
                   host = host,
                   port = port,
                   user = user,
                   password = password)

  }
