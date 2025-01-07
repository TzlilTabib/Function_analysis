N = 100
df <- data.frame(
  subject_code       = 1:N,
  age                = runif(N, min = 18, max = 35),
  gender             = sample(factor(c("male", "female")), size = N, replace = TRUE),
  avg_rt             = rnorm(N, mean = 1500, sd = 300),
  depression         = rnorm(N, mean = 40, sd = 15), 
  avg_sleep_duration = rnorm(N, mean = 6.5, sd = 2)
)

save(df, file = './df.rdata')

