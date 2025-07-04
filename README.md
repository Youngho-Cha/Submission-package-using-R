# An R package to calculate diagnostic performance metrics for IVD clinical trials

---

## 🎯 Purpose

This package helps users compute key diagnostic performance metrics such as:

- **Sensitivity**
- **Specificity**
- **Positive Predictive Value (PPV)**
- **Negative Predictive Value (NPV)**
- **Accuracy**
- **Area Under the Curve (AUC)**

It also calculates **100(1−α)% confidence intervals** for each metric.

---

## 📥 Installation

Install the package directly from GitHub using:

```r
devtools::install_github("Youngho-Cha/Submission-package-using-R")
```

or

```r
remotes::install_github("Youngho-Cha/Submission-package-using-R")
```

---

## 💡 Example Usage

```r
library(submission.package)

data("example_data")

actual <- example_data$actual
predicted <- example_data$predicted
score <- example_data$score

metrics <- calc_performance_metrics(actual, predicted, score)
formatted <- format_performance_output(metrics)
report_ready <- format_for_reporting(formatted, digits = 3)

save_performance_report(report_ready, format = "csv")
```

---

## ⚙️ Functions

### 🔹 1. `calc_performance_metrics()`

Calculates key performance metrics and their confidence intervals.

**Usage:**
```r
calc_performance_metrics(actual, predicted, score, 
                         metrics_to_calc = c("sensitivity","specificity","ppv","npv","accuracy","auc"), 
                         ci_method_binary = "cp",
                         ci_method_auc = "delong", 
                         alpha = 0.05, 
                         boot_n = 2000)
```

**Arguments:**
* 'actual': the true class label of each observation
* 'predicted': the predicted class label
* 'score': the predicted score (e.g., probability)
* 'metrics_to_calc': which metrics to calculate (default = all)
* 'ci_method_binary': method for CI of binary metrics (default = Clopper-Pearson)
* 'ci_method_auc': method for CI of AUC (default = DeLong)
* 'alpha': significance level (default = 0.05)
* 'boot_n': number of bootstrap iterations for AUC (default = 2000)

### 🔹 2. `format_performance_output()`

Formats the output of `calc_performance_metrics()` into an easy-to-read table.

**Usage:**
```r
format_performance_output(metrics)
```

**Arguments:**
* 'metrics': the output from the calc_performance_metrics() function containing the calculated performance metric values

### 🔹 3. save_performance_report()

Saves the formatted performance metrics table to a specified file.

**Usage:**
```r
save_performance_report(results_df, format = "csv", outdir = "results", filename = NULL)
```

**Arguments:**
* 'results_df': the tabular data formatted using the format_for_reporting() function
* 'format': file format to save (e.g., csv, xlsx) (default = "csv")
* 'outdir': name of the output directory where the file will be saved (default = "results")
* 'filename': name of the output file (default = NULL)

---

## 📬 Contact

* Author: Youngho Cha
* Email: cswer123@naver.com
