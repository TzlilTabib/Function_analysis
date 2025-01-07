library(dplyr)

### FUNCTION TO SUMMARIZE DESCRIPTIVE STATISTICS OF A DATA FRAME --------------- 
summarize_descriptives <- function(df, subject_start, subject_end) {
  # Checking the data length
  if (nrow(df) < 10) {
    stop("data is too short")
  }
  # Filtering data by specified parameters
  filtered_data <- df |>
    filter(subject >= subject_start, subject <= subject_end)
  
  ## Creating descriptive statistics table
  descriptives <- data.frame()
  
  for (col_name in names(filtered_data)) {
    variable <- filtered_data[[col_name]]
  
    # Descriptive statistics for continuous variables
    if (class(variable) %in% c("numeric", "integer")) {
      descriptives <- rbind(descriptives, data.frame(
        variable = col_name,
        type     = "continuous",
        min      = min(variable, na.rm = TRUE),
        max      = max(variable, na.rm = TRUE),
        mean     = mean(variable, na.rm = TRUE),
        sd       = sd(variable, na.rm = TRUE),
        levels   = "-",
        count    = "-"))
      }
  
    # Descriptive statistics for categorical variables
    else if (class(variable) %in% c("factor", "character")) {
      levels_count <- data.frame(table(variable, useNA = "ifany"))
      descriptives <- rbind(descriptives, data.frame(
        variable = col_name,
        type     = "categorical",
        min      = "-",
        max      = "-",
        mean     = "-",
        sd       = "-",
        levels   = paste(levels_count$variable, collapse = ", "),
        count    = paste(levels_count$Freq, collapse = ", ")))
      }
    }
  return(descriptives)
}

## Saving the file
writeLines(deparse(summarize_descriptives), './functions.R')
