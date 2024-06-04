install.packages("gtsummary")
install.packages("gt")

library(tidyverse)
library(gtsummary)
library(gt)

data<- read.csv("data/QOL_Thaassemia_pre.csv")

data |> 
  select(QOL_status_binary, 2:8) |> 
  tbl_summary(by = "QOL_status_binary") |> 
  add_overall()
  