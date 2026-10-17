# Life Expectancy: Comparing Mixed-Effects Models

An R analysis of life expectancy across **179 countries from 2000 to 2015**, comparing linear regression with models that account for repeated observations within countries.

Prepared for **STAT 437: Statistical Methods for Life History Analysis, Winter 2025**.

## Research question

How does accounting for country-level differences affect prediction of life expectancy, and can tree-based mixed-effects models improve on a linear mixed-effects model?

## Data and approach

The local dataset contains **2,864 country-year observations**, with 16 observations per country and 21 columns. The response is life expectancy; candidate predictors include year, region, vaccination coverage, HIV incidence, GDP per capita, schooling, and other health and socioeconomic measures.

The analysis includes exploratory plots, checks for multicollinearity, predictor selection, model fitting, residual diagnostics, and 10-fold cross-validation. Models are evaluated on the global dataset, Sub-Saharan Africa (SSA), and countries outside SSA.

| Model | Approach |
| --- | --- |
| Multiple linear regression (MLR) | Baseline without country random effects |
| Linear mixed-effects model (LME) | Linear predictors with a country random intercept |
| Mixed-effects regression tree (MERT) | Iterative regression-tree and random-effects fitting |
| Mixed-effects random forest (MERF) | Iterative random-forest and random-effects fitting |

The notebook also explores a random-slope LME model. Its GEE example is present but disabled.

## Results from the original analysis

Mean squared error from the original notebook's 10-fold cross-validation, rounded to two decimal places. **Lower is better.** These values were transcribed from page 41 of the [original rendered notebook](original-analysis.pdf); they have not been regenerated for this portfolio version.

| Model | Global | SSA | Outside SSA |
| --- | ---: | ---: | ---: |
| MLR | 11.06 | 11.08 | 7.72 |
| LME, random intercept | 1.17 | 2.33 | 0.48 |
| MERT | 2.72 | 2.68 | 0.81 |
| MERF | **0.28** | **0.72** | **0.13** |

MERF had the lowest recorded error in all three subsets. The random-intercept LME model also improved substantially on the linear regression baseline.

**Evaluation scope:** folds split individual country-year observations, so the same country can appear in training and validation. These results assess held-out observations within a largely familiar set of countries. They do not establish performance on unseen countries or future years. Country-grouped and time-based validation would be useful extensions. Associations in these observational data should not be interpreted as causal effects.

## Files

| File | Contents |
| --- | --- |
| [analysis.Rmd](analysis.Rmd) | Analysis code and commentary, with minor portfolio cleanup |
| [Life-Expectancy-Data-Updated.csv](Life-Expectancy-Data-Updated.csv) | Dataset used by the notebook |
| [original-analysis.pdf](original-analysis.pdf) | Original 67-page rendered notebook, preserved unchanged |
| [install-packages.R](install-packages.R) | Installs missing R dependencies |
| [PROJECT_NOTES.md](PROJECT_NOTES.md) | Changes, reproducibility notes, and attribution status |

## Run the analysis

Open the project folder in RStudio and run these commands in the R console with the project folder as your working directory:

```r
source("install-packages.R")
rmarkdown::render("analysis.Rmd", output_format = "html_document")
```

Rendering requires R and Pandoc; RStudio includes Pandoc. HTML output avoids requiring a LaTeX installation. The repeated forest fits and cross-validation can take a substantial amount of time. You can read the existing PDF without running the analysis.

Package versions were not locked in the original project. Random seeds are set inside the cross-validation functions, but full-data forest fits are not all seeded. Results may vary by environment and random state. See the project notes for validation performed on this copy.

## Attribution and data provenance

**Author: [Jialu Sun](https://github.com/j334sun).** This project was completed independently, including the data analysis and model comparison.

**Dataset:** [Life Expectancy (WHO) Fixed](https://www.kaggle.com/datasets/lashagoch/life-expectancy-who-updated), published on Kaggle by [Lasha (@lashagoch)](https://www.kaggle.com/lashagoch). Kaggle lists it under [CC0 1.0: Public Domain](https://creativecommons.org/publicdomain/zero/1.0/). This is the updated dataset, distinct from the earlier WHO dataset on Kaggle.

The file name, displayed size (307.57 kB), 2,864 rows, 21 columns, 179 countries, and 2000–2015 coverage match the local project dataset. The project author identified this as the likely original download source; a byte-for-byte comparison with a fresh download has not been performed.

The provider credits WHO, World Bank, and Our World in Data sources. Missing values were filled using nearby three-year averages or regional averages before this analysis. This upstream imputation is a limitation when interpreting the results. The dataset's CC0 designation does not license this project's code or report.

The project folder included these methodological references:

- Hajjem, A., Bellavance, F., and Larocque, D. (2011). *Mixed effects regression trees for clustered data*. Statistics & Probability Letters, 81, 451–459.
- Hajjem, A., Bellavance, F., and Larocque, D. (2014). *Mixed-effects random forest for clustered data*. Journal of Statistical Computation and Simulation, 84(6), 1313–1328. DOI: 10.1080/00949655.2012.741599.

The MERT and MERF functions here are the course-project implementations. Research-paper PDFs and the separate third-party `gmert_functions.R` file are not included; the analysis notebook does not source that file. No license has been selected for this draft.
