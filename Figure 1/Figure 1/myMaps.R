
setwd("~/china-province-border-data")

library(sf)
library(here)
library(tidyverse)
library(ggspatial)

china <- 'china.shp'
china_pro <- sf::read_sf(china)
nine <- 'china_nine_dotted_line.shp'
nine_line <- sf::read_sf(nine)

china_province <- ggplot() +
  geom_sf(data = china_pro, color = "black", fill = "lightgrey") +
  geom_sf(data = nine_line) + ylim(28,40) + xlim(103,124) 

city=read.table("FinalCap_renyan_6.12.txt",head=T)
china_province <- china_province + geom_point(aes(x=longitude,y=latitude,size=Number, color=Province), data=city) + scale_color_manual(values = c('green', 'red', 'blue', 'orange', 'darkblue', 'yellow','DeepPink', 'Purple')) + scale_size(range=c(0,2))
china_province <- china_province + theme_bw()
china_province <- china_province + theme(panel.grid=element_blank())
print(china_province)
