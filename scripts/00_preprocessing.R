install.packages("naniar")
library(naniar)

library(tidyverse)
data<- read.csv("data/QOL_Thalassemia (2).csv")

data<- data |> 
  mutate(QOL_status_binary = case_when(
    Total_SF_Score > 50 ~ "poor" ,
    Total_SF_Score <= 50 ~ "good"
  ))

data<- data |> 
  mutate(QOL_status_binary = case_when(
    Total_SF_Score > 50 ~ 0 ,
    Total_SF_Score <= 50 ~ 1
  ))

data<- data |> 
  mutate(QOL_status_ORDINARY = case_when(
    Total_SF_Score < 40 ~ 1 ,
    Total_SF_Score >= 40 & Total_SF_Score <= 60 ~ 2 ,
    Total_SF_Score >60 ~ 3
  ))

miss_var_summary(data)
gg_miss_var(data)  

write.csv(data, "data/QOL_Thaassemia_pre.csv" , row.names = F)

  
  

  
  
  
  
  