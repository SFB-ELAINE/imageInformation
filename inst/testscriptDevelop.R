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
input_dir <- "/home/kb/Unibox Rostock/Rohbilder + Export - Zen (Clemens Sehlke)/190815_EV38_2_Kollagen mit Asc u Dexa_63x_zstack_6"
input_dir <- "/home/kb/Unibox Rostock/Rohbilder + Export - Zen (Clemens Sehlke)/190815_EV38_2_Kollagen mit Asc u Dexa_63x_zstack_7"
input_dir <- "/home/kb/Unibox Rostock/Rohbilder + Export - Zen (Clemens Sehlke)/190815_EV38_2_Kollagen mit Asc u Dexa_63x_zstack_8"
input_dir <- "/home/kb/Unibox Rostock/Rohbilder + Export - Zen (Clemens Sehlke)/190815_EV38_2_Kollagen mit Asc u Dexa_63x_zstack_9"
input_dir <- "/home/kb/Unibox Rostock/Rohbilder + Export - Zen (Clemens Sehlke)/190815_EV38_2_Kollagen mit Asc u Dexa_63x_zstack_10"

input_file <- paste(input_dir, "/", "190815_EV38_2_Kollagen mit Asc u Dexa_63x_zstack_6_z01c1-3.tif", sep="")

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

write.csv(df_image_information,
          file = paste(input_dir, "/", "imageInformation.csv", sep=""))
