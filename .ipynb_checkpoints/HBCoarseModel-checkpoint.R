setwd('/Users/Anthony/OneDrive - UW/University of Washington/Data and Modeling/')
library(terra)
library(sf)
library(spatialEco)
library(lidR)
library(tidyterra)
library(dplyr)
library(whitebox)
library(MultiscaleDTM)
library(lubridate)
library(tmap)
library(randomForest)
library(caret)

#hello

pts <- vect("WIP Testing/data/HBdata30m/hbpts_hydrog_strata.gpkg")
stack <- rast("WIP Testing/data/HBdata30m/hbpts_hydrog_strata.gpkg",
                    lyrs = c("dem", "slp_3", "slp_27", "slp_81", 
                             "meancurv_3", "prof_curv_3", "plan_curv_3",
                             "meancurv_27", "prof_curv_27", "plan_curv_27",
                             "meancurv_81", "prof_curv_81", "plan_curv_81",
                             "tpi_3", "tpi_27", "tpi_81"))

pts_extract <- pts |> terra::extract(x = stack, bind = TRUE, xy = TRUE) |>
    drop_na() |> select(-dem1m) 

names(pts_extract) <- (c("class", "dem", "slp_3", "slp_27", "slp_81", 
                           "meancurv_3", "prof_curv_3", "plan_curv_3",
                           "meancurv_27", "prof_curv_27", "plan_curv_27",
                           "meancurv_81", "prof_curv_81", "plan_curv_81",
                           "tpi_3", "tpi_27", "tpi_81",
                           "x", "y"))

pts_exdf <- as.data.frame(pts_extract) |> mutate(class = as.factor(class)) |> 
    select(-c(x,y))

# Validation Set 
train.index <- as.vector(sample(c(1:nrow(pts_exdf)), 0.7*nrow(pts_exdf), replace=F))

train <- pts_exdf[train.index, c("class", "dem", "slp_3", "slp_27", "slp_81", 
                                   "meancurv_3", "prof_curv_3", "plan_curv_3",
                                   "meancurv_27", "prof_curv_27", "plan_curv_27",
                                   "meancurv_81", "prof_curv_81", "plan_curv_81",
                                   "tpi_3", "tpi_27", "tpi_81")]

test <- pts_exdf[-train.index, c("class", "dem", "slp_3", "slp_27", "slp_81", 
                                   "meancurv_3", "prof_curv_3", "plan_curv_3",
                                   "meancurv_27", "prof_curv_27", "plan_curv_27",
                                   "meancurv_81", "prof_curv_81", "plan_curv_81",
                                   "tpi_3", "tpi_27", "tpi_81")]

set.seed(11)
#wetwt <- ifelse(train$class == "WET", 3, 1)

rf_model <- randomForest((class) ~ ., mtry = 12, 
                         sampsize = nrow(train[train$class == "WET",]),
                         replace = TRUE, #weights = wetwt, 
                         nodesize =1,
                         ntree = 1000, na.action = na.omit,
                         importance = TRUE, data = train)
plot(rf_model)

rf.test <- predict(rf_model, newdata = test, type = "response")
rf.train <- predict(rf_model, newdata = train)
caret::confusionMatrix(rf.train, train$class)
caret::confusionMatrix(rf.test, test$class)
vip::vip(rf_model, num_features = 15)

nodes <- list()
for (i in 1:1000){
    tree <- as.data.frame(getTree(rf_model, k = i))
    nodes[i] <- nrow(tree[tree$status == -1, ])
}
mean(unlist(nodes))
