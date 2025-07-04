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

---

## ✅ 3. Example code

### 💡 Example Usage

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

## ✅ 4. Function 

### ⚙️ Functions

#### 🔹 1. `calc_performance_metrics()`

Calculates key performance metrics and their confidence intervals.

**Usage:**
```r
calc_performance_metrics(actual, predicted, score, 
                         metrics_to_calc, 
                         ci_method_binary, 
                         ci_method_auc, 
                         alpha, 
                         boot_n)
```

**Arguments:**
* actual: the true class label of each observation
* predicted: the predicted class label
* score: the predicted score (e.g., probability)
* metrics_to_calc: which metrics to calculate (default = all)
* ci_method_binary: method for CI of binary metrics (default = Clopper-Pearson)
* ci_method_auc: method for CI of AUC (default = DeLong)
* alpha: significance level (default = 0.05)
* boot_n: number of bootstrap iterations for AUC (default = 2000)




