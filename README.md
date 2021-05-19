# `rtsVis`
<img align="right" src="https://github.com/JohMast/rtsVis_demo/blob/main/Images/rtsVis_Logo.png" width="130" height="150" />


## Introduction

`rtsVis`is a lightweight `R` package to visualize large raster time series, building on a fast temporal interpolation core.
This repository contains a demonstration of the packages functionalities.

## Installation

The released version of rtsVis can be installed from CRAN:
```r
install.packages("rtsVis")
```


The latest version of the package can be installed from github. 

```r
devtools::install_github("JohMast/rtsVis")
```

## Contents
This repository contains data needed to get started with rtsVis.

* **demo_script.R**: A script demonstrating the basic usage of the packages main functions.
* **Data**:
    * **Western_Cape_polygons.shp**: Selected Polygons within a AOI in South Africa.
    * **Western_Cape_pts.shp**: Selected points within a AOI in South Africa.
    * **example__polygon.rds**: An example tibble containing values extracted over the polygons. Useful for experimenting with custom plot functions.
    * **example__point.rds**: An example tibble containing values over the points. Useful for experimenting with custom plot functions.
    * **MODIS_WesternCape_filled.txt**: A preprocessed MODIS time series of the AOI ready for visualization.

* **Vignettes**:
    * **rtsVis_Overview.html**: An overview of the rtsVis package.
    * **rtsVis_Custom_Plots.html**: A guide on the creation of custom plotting functions.
* **Images**: Examples of Image Files created by rtsVis, as demonstrated in the demo_script.

<img src="https://github.com/JohMast/rtsVis_demo/raw/main/Images/WesternCape_MODIS_point_lowres.gif" align="center" src="https://github.com/JohMast/rtsVis_demo/raw/main/Images/WesternCape_MODIS_point_lowres.gif">

<img src="https://github.com/JohMast/rtsVis_demo/raw/main/Images/example_ts_gg_bar.png" align="center" src="https://github.com/JohMast/rtsVis_demo/raw/main/Images/WesternCape_MODIS_point_lowres.gif">
