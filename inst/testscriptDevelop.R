# Testscript for using the R package imageInformation for development  +++++
# Author: Kai Budde
# Last changed: 2020/02/04


# Delete everything in the environment
rm(list = ls())
# close all open plots in RStudio
graphics.off()


# Please adapt the following parameters ####################################
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# Directory of the images
input_dir <- "tests/images6"

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# Load packages ############################################################

library(devtools)

# Document package
document()
# Check package
check()
# Load package to use it
load_all()

## FIRST EXAMPLE: Directory ------------------------------------------------

# Obtain all positions of cilia in every z-layer
df_image_information <- imageInformation(input_dir = input_dir)
