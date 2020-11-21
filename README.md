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
    * **MODIS_WesternCape_filled.txt**: A preprocessed MODIS time series ready for visualization.
    * **example__point.rds**: An example tibble containing values over points. Useful for experimenting with custom plot functions.
    * **example__polygon.rds**: An example tibble containing values extracted over polygons. Useful for experimenting with custom plot functions.
* **Vignettes**:
    * **rtsVis_Overview.html**: An overview of the rtsVis package.
    * **rtsVis_Custom_Plots.html**: A guide on the creation of custom plotting functions.
* **Images**: Examples of Image Files created by rtsVis, as demonstrated in the demo_script.

<img src="Images/WesternCape_MODIS_point_lowfps.gif" align="center" src="https://github.com/JohMast/rtsVis_demo/blob/main/Images/WesternCape_MODIS_point_lowfps.gif">

