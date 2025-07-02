
library(submission.package)
library(epiR)
library(pROC)
library(dplyr)
library(kableExtra)
library(ggplot2)

# 분석용 예제 데이터 생성
test_data=generate_test_data(N=300,prevalence=0.5)
actual=test_data$acutal
predicted=test_data$predicted
score=test_data$score

# 분석
metrics=calc_perform_metrics(actual,predicted,score)
formatted=format_performance_output(metrics)
report_ready=format_for_reporting(formatted,digits=3)

# 결과 출력
print(report_ready)

# 보고서 저장
save_performance_report(report_ready,format="csv")
