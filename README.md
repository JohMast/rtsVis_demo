# `rtsVis`

## Introduction

`rtsVis`is a lightweight `R` package to visualize large raster time series, building on a fast temporal interpolation core.
This repository contains 

## Installation

The latest version of the package can be installed from github. 

```r
devtools::install_github("16EAGLE/rtsVis")
```

## Contents
This repository contains data needed to get started with rtsVis.

* **demo_script.R**: 
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

<img src="Images/WesternCape_MODIS_violin_lowfps.gif" align="center" src="https://github.com/JohMast/rtsVis_demo/blob/main/Images/WesternCape_MODIS_violin_lowfps.gif.gif">

