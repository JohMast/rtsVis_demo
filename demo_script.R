# rtsVis demo script
# Author: https://github.com/JohMast
# 18.05.2021

library(rtsVis)
library(raster)
library(sf)
library(moveVis)
library(magrittr) 
library(ggplot2)


#### Step 1 : Getting the data ####

#download.file("https://gigamove.rz.rwth-aachen.de/d/id/TDEtwH5y5GwMNS/dd/100","Data/MODIS_WesternCape_filled.rds")
r_list_filled <- readRDS("../Beispieldaten/MODIS/WesternCape/MODIS_WesternCape_filled.rds")

# png(filename = "Images/R_filled_Example.png",width = 6,height = 6,units = "in",res = 200)
# plotRGB(r_list_filled[[20]],1,4,3,stretch="lin")
# dev.off()


#### Step 2 :  Interpolating to the desired number of frames ####

# Getting the Dates
in_dates <- names(r_list_filled)  %>% as.POSIXct
out_dates <-seq.POSIXt(from = in_dates[1],
                       to = in_dates[length(in_dates)],
                       length.out = length(in_dates)*2 )
#Interpolate

r_list_filled_interpolated <-  ts_raster(r_list = r_list_filled,
                                         r_times = in_dates,
                                         out_times = out_dates,
                                         fade_raster = T)

#### Step 3 : Flow Frames ####

# Violin Plot
polygons <- st_read("../Beispieldaten/Ancillary/WesternCape/Western_Cape_polygons.shp") %>% st_transform(crs = st_crs(r_list_filled_interpolated[[1]]))
violin_frames <- rtsVis::ts_flow_frames(r_list = r_list_filled_interpolated,
                                        positions = polygons,
                                        plot_function = "violin",
                                        #
                                        position_names = polygons$NAME_3,
                                        band_names = c("620 - 670","841 - 876","459 - 479","545 - 565"),
                                        band_colors = c("firebrick3","darkorchid3","dodgerblue3","olivedrab3"),
                                        band_legend_title = "Wavelength [nm]",
                                        position_legend = F,
                                        legend_position = "left",
                                        band_legend=F,
                                        aes_by_pos = F)
# ggsave(violin_frames[[10]],filename = "Images/violin_frames_example.png",width = 6, height=6)

# Line Plot
points <- st_read("../Beispieldaten/Ancillary/WesternCape/Western_Cape_pts.shp") %>% st_transform(crs = st_crs(r_list_filled_interpolated[[1]]))
line_frames <- rtsVis::ts_flow_frames(r_list = r_list_filled_interpolated,
                                      positions = points[c(1,3,4),],
                                      plot_function = "line",
                                      position_names = points$pointname[c(1,3,4)],
                                      band_names = c("620 - 670","841 - 876","459 - 479","545 - 565"),
                                      band_colors = c("firebrick3","darkorchid3","dodgerblue3","olivedrab3"),
                                      band_legend_title = "Wavelength [nm]",
                                      position_legend = T,
                                      legend_position = "left",
                                      band_legend=T,
                                      aes_by_pos = T)
# ggsave(line_frames[[length(line_frames)]],filename = "Images/line_frames_example.png",width = 6, height=6)


#### Step 4: Making and enhancing Frames ####

# making Frames
r_frames <- ts_makeframes(x_list = r_list_filled_interpolated,l_indices = c(1,4,3),maxq = 0.999)
# ggsave(r_frames[[10]],filename = "Images/r_frames_example.png",width = 6, height=6)

# adding Style Elements
r_frames_styled <- r_frames %>%
  moveVis::add_labels(x = "Longitude", y = "Latitude")%>% 
  moveVis::add_northarrow(colour = "white", position = "bottomright") %>% 
  moveVis::add_timestamps(type = "label") %>% 
  moveVis::add_progress()
# ggsave(r_frames_styled[[10]],filename = "Images/r_frames_styled_example.png",width = 6, height=6)

# adding positions
r_frames_with_polygons <- 
  rtsVis::ts_add_positions_to_frames(r_frame_list = r_frames_styled,
                                     positions = polygons,
                                     aes_by_pos = T,
                                     legend_position = "right",
                                     position_names = polygons$NAME_3,
                                     position_legend_title = "Municipality",
                                     psize = 1,
                                     add_text = T,
                                     tsize = 3,
                                     t_hjust = 5000,
                                     ttype = "label")

# ggsave(r_frames_with_polygons[[10]],filename = "Images/r_frames_with_polygons_example.png",width = 6, height=6)

r_frames_with_points <- 
  rtsVis::ts_add_positions_to_frames(r_frame_list = r_frames_styled,
                                     position_names = points$pointname,
                                     positions = points,
                                     add_text = T,
                                     tsize = 4,
                                     ttype = "label",
                                     t_vjust = 9500 )
# ggsave(r_frames_with_points[[10]],filename = "Images/r_frames_with_points_example.png",width = 6, height=6)

#### Step 5 : Joining Frames ####

point_joined<- moveVis::join_frames(frames_lists = list(r_frames_with_points,line_frames))
# ggsave(point_joined[[10]],filename = "Images/point_joined_example.png",width = 14, height=7)

poly_joined<- moveVis::join_frames(frames_lists = list(r_frames_with_polygons,violin_frames))
# ggsave(poly_joined[[10]],filename = "Images/poly_joined_example.png",width = 14, height=7)

#### Step 6 : Animating Frames ####

moveVis::animate_frames(point_joined,
                        out_file = "Images/WesternCape_MODIS_point.gif",
                        end_pause = T,width=1600)