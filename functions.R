### FUNCTION TO SUMMARIZE DESCRIPTIVE STATISTICS OF A DATA FRAME --------------- 
summarize_descriptives <- function(df) {
  if (nrow(df) < 10) {
    stop("data is too short")}
  descriptives <- data.frame()
  for (col_name in names(df)) {
    variable <- df[[col_name]]
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
  # Descriptive statistics for categorical variables
  } else if (class(variable) %in% c("factor", "character")) {
    levels_count <- data.frame(table(variable, useNA = "ifany"))
    descriptives <- rbind(descriptives, data.frame(
      variable = col_name,
      type     = "categorical",
      min      = "-",
      max      = "-",
      mean     = "-",
      sd       = "-",
      levels   = paste(levels_count$variable, collapse = ", "),
      count    = paste(levels_count$Freq, collapse = ", ")))}}
  return(descriptives)}

## Saving the file
save(summarize_descriptives, file = './functions.R')
