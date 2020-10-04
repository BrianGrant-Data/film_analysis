
# Libraries ---------------------------------------------------------------

library(data.table)
library(tidyverse)

# Objects -----------------------------------------------------------------

data <- as.data.frame(fread("data/data.tsv")) #this data set was gzipped from the following link: https://datasets.imdbws.com/name.basics.tsv.gz. More info can be found at https://datasets.imdbws.com/
subset1 <- head(data)
columns <- as.list(colnames(data))


# Obtaining genres list --------------------------------------------------------

genre_split <- function(genre_col){
  genres <- c()
  for (row in genre_col){
    x <- strsplit(row, ",")
    for (item in x){
      genres <- c(genres, item)
      genres <- genres[!duplicated(genres)]
    }
  }
  return(genres)
}

genres <- genre_split(subset1$genres)
# genres <- genre_split(data$genres)

# ? -----------------------------------------------------------------------





