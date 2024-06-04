install.packages("gtsummary")
install.packages("gt")

library(tidyverse)
library(gtsummary)
library(gt)

data<- read.csv("data/QOL_Thaassemia_pre.csv")

data |> 
  select(1:8) |> 
  tbl_summary(statistic = list(
    all_continuous() ~ "{mean} ({sd})"
  )) |> 
  as_gt() |> 
  gtsave("table/Table1_demographics.docx")


data |> 
  select(9:17) |> 
  tbl_summary(type = all_categorical() ~ "categorical" ,
statistic = list(all_continuous() ~ "{mean} ({sd})")) |>
  as_gt() |> 
  gtsave("table/Table2_Clinical.docx")

data|> 
  select(Type_of_Family, 18:25) |> 
  tbl_summary(type = everything() ~ "continuous",
              by = "Type_of_Family") |> 
  add_overall() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  bold_labels()
  
  
  
   
  
  
  
  
  
  
  
  
