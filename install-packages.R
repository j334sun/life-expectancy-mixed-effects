# Run once from the project directory. Installs only missing packages.
packages <- c(
  "rmarkdown", "knitr", "ggplot2", "dplyr", "lattice", "car", "geepack",
  "rpart", "rpart.plot", "nlme", "caret", "randomForest",
  "randomForestExplainer", "mgcv", "lme4"
)
missing <- setdiff(packages, rownames(installed.packages()))
if (length(missing)) install.packages(missing, repos = "https://cloud.r-project.org")
