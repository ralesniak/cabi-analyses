
download_cabi <- function(.x) {
  
  path <- glue("{prefix}-capitalbikeshare-tripdata.zip",
               prefix = .x)
  
  folder <- "C:/Users/Rachel/Desktop/data/"
  
  download.file(url = glue("https://s3.amazonaws.com/capitalbikeshare-data/{path}"), 
                destfile = glue("{folder}{path}"))
  
  unzip(zipfile = glue("{folder}{path}"))
}

walk(.x = prefixes, .f = download_cabi)
