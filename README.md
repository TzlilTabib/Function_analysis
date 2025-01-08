# Function_analysis
R course for beginners week 9 assignment, an analysis using user-defined functions

## Scripts
### functions
- Includes a function to summarize descriptive statistics of any wide format data set.
- The function receives 3 parameters:
  1. The data set
  2. subject_start - the subject from which to start the analysis.
  3. subject_end - last subject of the analysis, enables filtering of the data. 
- Subject id column in the data must be entitled "subjects", for the filtering feature.
- Output table in the consule includes data set variables as lines and descriptives as columns. Descriptives provided:
  1. variable name
  2. variable type (i.e. categorical or continuous)
  3. minimum value (only for continuous variables)
  4. maximum value (only for continuous variables)
  5. mean (only for continuous variables)
  6. standard deviation (only for continuous variables)
  7. levels (only for categorical variables, separated by ',')
  8. count by level (only for categorical variables, separated by ',' in accordance to levels' order)

### analysis
- Creates a data set of N subjects.
- Imports the functions file and uses summarize_descriptives.  
