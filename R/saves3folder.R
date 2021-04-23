#' Downloads the contents of an S3 bucket or folder to local
#'
#' Essentially applies `aws.s3::save_object()` to all objects inside of
#' an S3 bucket or folder.
#'
#' @param bucket S3 bucket name, excluding "s3://"
#' @param path path to local directory in which to copy the folder
#' @param prefix optional. Path from the bucket to the directory, ending in a slash
#'
#' @export

saves3folder <- function(bucket, path, prefix = NULL) {
  df <- aws.s3::get_bucket_df(bucket, prefix = prefix)
  df <- df[df$Size != 0, ]  # remove directories, which don't copy
  key <- df$Key
  local_paths <- file.path(path, key)
  purrr::map2(key, local_paths,
              ~aws.s3::save_object(object = .x, file = .y, bucket = bucket))
}

# Eventually, hopefully this function in aws.s3 will work.
# s3sync(bucket = "tmc-research-projects",
#        prefix = "p039_fa_meta/",
#        path = "~/Downloads",
#        direction = "download")
