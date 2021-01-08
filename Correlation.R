# Packages ----------------------------------------------------------------

library(tidyverse)
library(data.table)


# RowSums -----------------------------------------------------------------
matrix_occurences$total <- rowSums(matrix_occurences[,2:16])  


# Relative frequencies ----------------------------------------------------

occurences_relative <- matrix_occurences %>% 
  mutate_at(
    vars(-matches("word|total")),
    ~ .x * 1000 / total
  )

# Deleting unnecessary data ------------------------------------------------
occurences_relative$word <- NULL
occurences_relative$total <- NULL

# Creating the matrix -----------------------------------------------------
occurences_relative <- as.matrix(occurences_relative)
rownames(occurences_relative)<-matrix_occurences$word

# Correlation -------------------------------------------------------------
correlation<- cor(occurences_relative)

