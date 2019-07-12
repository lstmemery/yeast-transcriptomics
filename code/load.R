### SCRIPT TO LOAD DATA AND CLEAN UP ###

# load the 5 data tables in the 'data' folder
condition_annotation <- fread(here::here("data", "conditions_annotation.csv"))
labels_BP <- fread(here::here("data", "labels_BP.csv"))
labels_CC <- fread(here::here("data", "labels_CC.csv"))
labels_MF <- fread(here::here("data", "labels_MF.csv"))
SC_expression <- fread(here::here("data", "SC_expression.csv"))

# explore data structures of the expression table
str(SC_expression)
glimpse(SC_expression)
