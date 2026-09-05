
#"本图基于自然资源部标准地图服务，审图号：GS(2024)0650号，底图无修改"
setwd("/Users/clusterreed/Documents/am3_yz1/guest/renyan/")

library(sf)
library(here)
library(tidyverse)
library(ggspatial)

#========= 替换底图：读取天地图官方GeoJSON，替换原来china.shp =========
# 把你下载的天地图省级geojson文件名填在这里，例如 "province.geojson"
china_geojson <- "province.geojson"
china_pro <- sf::read_sf(china_geojson)

# ！！！重点：本图xlim/ylim只绘制国内局部区域，不显示南海，移除旧的nine九段线shp（民间无审图号，废弃）

# 绘图主体，保留你原来全部样式、坐标裁剪
china_province <- ggplot() +
  geom_sf(data = china_pro, color = "black", fill = "white") +
  # geom_sf(data = nine_line)  # =====注释/删除，不再使用民间九段线shp=====
ylim(28,40) + xlim(103,124) 

# 读取点位文件（保留你的原始路径）
city=read.table("/Users/clusterreed/Documents/am3_yz1/guest/renyan/FinalCap_renyan_6.12.txt",head=T)

# 叠加点位，完全沿用你的配色、size设置
china_province <- china_province + 
  geom_point(aes(x=longitude,y=latitude,size=Number, color=Province), data=city) + 
  # scale_color_manual(values = c('green', 'red', 'blue', 'orange', 'darkblue', 'yellow','DeepPink', 'Purple')) + 
  scale_color_manual(values = c('red', 'red', 'red', 'red', 'red', 'red','red', 'red')) + 
  
  scale_size(range=c(0,2))

# 主题设置 + 【论文必须：审图号图注】
china_province <- china_province + 
  theme_bw() +
  theme(panel.grid=element_blank()) +
  theme(plot.caption = element_text(hjust = 0, size = 9)) # 图注靠左对齐，符合期刊习惯
# labs(caption = "本图基于自然资源部标准地图服务，审图号：GS(2024)0650号，底图无修改") +

print(china_province)
ggsave("map_province2.pdf",china_province,width=8,height=6,dpi=300)
