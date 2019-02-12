#  Exercise2.R  short script for part of the Intro to GitHub example (Exercise2.R)
#  BUS212a - Spring 2019, Prof. Kamis
#  Modified by: Gloria Zheng

# create some basic graphs using the diamonds dataframe that is included 
#     with package ggplot2
# you should explore this script, and then edit the code as instructed at the end.
#

library(ggplot2)  # includes 'diamonds' dataframe. 
library(RColorBrewer)

str(diamonds)  
# examine the structure of the diamonds df

# our  goal is to model price as a function of other attributes.
# This script does some simple exploratory visualization, after dividing the 
# full data frame into training and test partitions.

#################
# Partition the data, as shown in Chapter 2
# use set.seed() to get the same partitions when re-running the R code.
set.seed(42)

## Start by randomly partitioning into training (70%) and validation (30%) datasets
# randomly sample 70% of the row IDs for training; the remaining 30% serve as a
# validation partition to compare with the training data
train.rows <- as.numeric(sample(rownames(diamonds), dim(diamonds)[1]*0.7))

# collect all the columns with training row ID into training set:
train.data <- diamonds[train.rows, ]

# assign row IDs that are not in the training partition to be in the validation partition
valid.rows <- as.numeric(setdiff(rownames(diamonds), train.rows))
valid.data <- diamonds[valid.rows, ]

## Now make plots based on the training and validation sets

p1 <- ggplot(train.data, aes(carat, price, color = clarity)) +
  geom_point(alpha = 0.10) +
  geom_smooth(se=FALSE) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "Price vs Carat, accounting for diamond cut",
       caption = "GGPLOT of Training Data")
p1

p2 <- ggplot(valid.data, aes(carat, price, color = clarity)) +
  geom_point(alpha = 0.10) +
  geom_smooth(se=FALSE) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "Price vs Carat, accounting for diamond cut",
       caption = "GGPLOT of Validation Data") 
p2

# Here we can compare the results of the two subsets. 

# 1. In line 3, add your name to "Modified by:  "
# 2. Change the size of the training set from 60% to 70%. Rerun the code is see how much of a difference that makes.
# 3. In both plots, change the categorical variable of interest from diamond color to diamond cut. Edit the plot titles.
# 4. Repeat 3. with the categorical variable of interest changed to diamond clarity.
# 5. Copy this R script to an Rmd script and include steps 1-4 in it. In your report, interpret your results and reflect upon your modeling process.
#
# After you finish modifying this code, save it, commit the changes, and then push the revised code back 
# to GitHub.