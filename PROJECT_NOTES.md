# Portfolio preparation notes

## Changes from the course-project folder

- Renamed the main notebook to `analysis.Rmd` and gave it a descriptive title.
- Normalized named R chunk labels and made repeated labels unique so knitr can parse the notebook.
- Corrected the non-SSA minimal-depth plot to use `min_depth_non_ssa` instead of the SSA results.
- Corrected the Polio summary plot's variable name and HIV labels to match the Polio values it already used.
- Corrected the HIV and Hepatitis B GAM plot titles to match their predictors.
- Added a README, package-installation helper, and `.gitignore`.
- Preserved the original rendered notebook and CSV byte-for-byte. The original PDF includes console output, warnings, and some clipped code lines; it is an archival notebook, not a newly typeset report.
- Left the statistical fitting functions, predictors, and cross-validation procedure unchanged.

Excluded older drafts, STAT 444 files, assignment instructions, research-paper PDFs, R session histories, and the unused third-party helper script.

## Reproducibility and interpretation

The original PDF predates these small presentation corrections. Its result table is used as a historical record, not evidence that the cleaned notebook has been rerun end to end.

The cross-validation uses row-level folds. Country-level effects can therefore be estimated from other years for the same country; this is a different task from predicting an entirely new country. Random forests and iterative fits may change across runs and package versions. The MERT/MERF functions are educational implementations and have not been independently validated against the referenced papers.

## Checks completed

- knitr extracted all code successfully after the chunk-label cleanup; all 145 R expressions parsed successfully.
- Ran the first 29 expressions, covering package loading, CSV input, the initial linear model and multicollinearity diagnostics, predictor filtering, and region recoding.
- Confirmed 2,864 complete rows, 179 countries, and 16 records per country.
- All referenced R packages and Pandoc are available in the current local environment.
- Checked README file links and verified the copied CSV and PDF against the originals with SHA-256 hashes.
- Did not run the full iterative model fitting, cross-validation, or a complete HTML/PDF render.

## Attribution and publication status

The author confirmed that this project was completed independently by Jialu Sun; the README reflects that attribution. The repository belongs to `j334sun` and remains private pending the author's visibility choice.

The author identified [Life Expectancy (WHO) Fixed on Kaggle](https://www.kaggle.com/datasets/lashagoch/life-expectancy-who-updated) by Lasha (@lashagoch) as the likely dataset source. Checked on October 16, 2026: the listing's filename, displayed size (307.57 kB), 2,864 rows, 21 columns, 179 countries, and 2000–2015 coverage match the local CSV. Kaggle displays **CC0: Public Domain**, linking to https://creativecommons.org/publicdomain/zero/1.0/. A fresh-download byte comparison has not been performed.

The source explains that missing values were filled with nearby three-year averages or regional averages. The README now credits the source and notes this upstream imputation. No license has been selected for the project's code or report.

## GitHub repository

Repository: https://github.com/j334sun/life-expectancy-mixed-effects

The original PDF is stored at the repository root as `original-analysis.pdf` for a simple browser upload. The original course folder remains unchanged.
