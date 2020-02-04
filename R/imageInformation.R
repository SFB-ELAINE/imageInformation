#' @title imageInformation
#' @description Main function for getting image information
#' @details Input should be tif-format.
#' @aliases imageinformation
#' @author Kai Budde
#' @export imageInformation
#' @param input_dir A character (directory that contains all images)
#' @param input_file A character (image file)
#' @import stats

imageInformation <- function(input_dir = NULL,
                             input_file = NULL) {


  # Basics and sourcing functions ------------------------------------------
  .old.options <- options()
  on.exit(options(.old.options))

  options(stringsAsFactors = FALSE, warn=-1)

  # Function call without arguments
  if(is.null(input_dir) & is.null(input_file)){
    print(paste("Please call the function with either an input directory ",
                "or input tif file.",
                sep=""))
    return()
  }

  # ---------------------------------------------------------------------- #
  # ---------------------- Get all file names ---------------------------- #
  # ---------------------------------------------------------------------- #

  if(!is.null(input_dir)){
    # Input dir given

    # Save the file names (tifs) ----------------------------------
    file_names <- list.files(path = input_dir)
    file_names <- file_names[grepl("tif", file_names)]
    file_names <- paste(input_dir, "/", file_names, sep="")

  }else{
    # Single file name given

    # check if file is a tif file
    if(grepl("tif", input_file)){
      file_names <- input_file
    }else{
      print("Please call the function with a tif file.")
      return()
    }
  }

  # ---------------------------------------------------------------------- #
  # ---------------------- Empty data frame that will be filled ---------- #
  # ---------------------------------------------------------------------- #

  number_of_rows <- length(file_names)
  df <- data.frame(image_name = rep(NA, number_of_rows),
                   number_red_pixels = rep(NA, number_of_rows),
                   sum_red_pixel_intensities = rep(NA, number_of_rows),
                   mean_red = rep(NA, number_of_rows),
                   median_red = rep(NA, number_of_rows),
                   number_green_pixels = rep(NA, number_of_rows),
                   sum_green_pixel_intensities = rep(NA, number_of_rows),
                   mean_green = rep(NA, number_of_rows),
                   median_green = rep(NA, number_of_rows),
                   number_blue_pixels = rep(NA, number_of_rows),
                   sum_blue_pixel_intensities = rep(NA, number_of_rows),
                   mean_blue = rep(NA, number_of_rows),
                   median_blue = rep(NA, number_of_rows))

  # ---------------------------------------------------------------------- #
  # ---------------------- Go trough all files --------------------------- #
  # ---------------------------------------------------------------------- #
  for(i in 1:length(file_names)){
    print(paste("Dealing with file ", file_names[i], ". (It is now ",
                Sys.time(), ".)", sep=""))

    # Image name
    image_name <- gsub("(.*)\\.tif*", "\\1", file_names[i])
    image_name <- gsub("/.*/(.*)", "\\1", image_name)

    # Read image -----------------------------------------------------------

    image <- tiff::readTIFF(source = file_names[i],
                            convert = TRUE, info = FALSE)

    # Write image information into data frame ------------------------------

    # Image name
    df$image_name[i] <- image_name

    # RED
    # Number of red pixels
    df$number_red_pixels[i] <- sum(image[,,1] > 0)
    # Sum of red pixel intensities
    df$sum_red_pixel_intensities[i] <- sum(image[,,1])
    # Mean of red pixel intensities
    df$mean_red <- mean(image[,,1][image[,,1] != 0])
    # Median of red pixel intensities
    df$median_red <- median(image[,,1][image[,,1] != 0])

    # GREEN
    # Number of green pixels
    df$number_green_pixels[i] <- sum(image[,,2] > 0)
    # Sum of green pixel intensities
    df$sum_green_pixel_intensities[i] <- sum(image[,,2])
    # Mean of green pixel intensities
    df$mean_green <- mean(image[,,2][image[,,2] != 0])
    # Median of green pixel intensities
    df$median_green <- median(image[,,2][image[,,2] != 0])

    # BLUE
    # Number of blue pixels
    df$number_blue_pixels[i] <- sum(image[,,3] > 0)
    # Sum of blue pixel intensities
    df$sum_blue_pixel_intensities[i] <- sum(image[,,3])
    # Mean of blue pixel intensities
    df$mean_blue <- mean(image[,,3][image[,,3] != 0])
    # Median of blue pixel intensities
    df$median_blue <- stats::median(image[,,3][image[,,3] != 0])

  }

  return(df)

}
