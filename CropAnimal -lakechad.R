getwd
setwd("C:/Users/Beloved/Desktop/587")

library(readxl)
ani <- read_xlsx("Animaldata.xlsx")
ani

library(ggplot2)

par(mfrow=c(1,1))
ggplot(data = ani)+ 
  geom_point(mapping = aes(x = Country, y = Y2012, color = Animals))
ggplot(data = ani)+ 
  geom_point(mapping = aes(x = Country, y = Y2020, color = Animals))

(library(tidyr))




pivot_longer(ani, cols = c("Y2012", "Y2020")) %>%
  ggplot(aes(name, value, fill = Animals)) +
  geom_col() +
  facet_grid(~Country, switch = "x") +
  scale_x_discrete(expand = c(0.5, 0.5)) +
  scale_fill_viridis_d() +
  labs(x = "Animals in the four major Lake Chad Countries") + 
  labs(y = "Headcount of Animals") + 
  theme_classic() +
  theme(panel.spacing = unit(0, "points"),
        strip.placement = "outside",
        strip.background = element_blank())


ggsave("ggplot2save5.jpg")
ggsave("ggplot2save.jpg", width = 18, height = 10, units = c("cm"), dpi = 800)

library(readxl)
crop <- read_xlsx("CropData.xlsx")
crop

pivot_longer(crop, cols = c("Y2012", "Y2020")) %>%
  ggplot(aes(name, value, fill = Crops)) +
  geom_col() +
  facet_grid(~Country, switch = "x") +
  scale_x_discrete(expand = c(0.5, 0.5)) +
  scale_fill_viridis_d() +
  labs(x = "Crops in the four major Lake Chad Countries") + 
  labs(y = "Production Quantities in tonnes") + 
  theme_classic() +
  theme(panel.spacing = unit(0, "points"),
        strip.placement = "outside",
        strip.background = element_blank())


cpwr <- get_power_apsim_met(lonlat = c(-98.48, 39.01), 
                            dates = c("2010-01-01",
                                      "2020-12-31"))


#Getting the weather data of close areas in the lake chad region

library(apsimx)

?get_power_apsim_met

Maiduguri <- get_power_apsim_met(lonlat = c(13.15, 11.83), 
                            dates = c("1990-01-01",
                                      "2020-12-31"))

plot(Maiduguri, years = 2015:2020, met.var = "rain", cumulative = TRUE, climatology = TRUE)

Ndjamena <- get_power_apsim_met(lonlat = c(15.05, 12.13), 
                            dates = c("1990-01-01",
                                      "2020-12-31"))

plot(Ndjamena, years = 2015:2020, met.var = "rain", cumulative = TRUE, climatology = TRUE)

Maroua <- get_power_apsim_met(lonlat = c(14.32, 10.59), 
                              dates = c("1990-01-01",
                                        "2020-12-31"))

plot(Maroua, years = 2015:2020, met.var = "rain", cumulative = TRUE, climatology = TRUE)

Nguigmi <- get_power_apsim_met(lonlat = c(13.11, 14.25), 
                               dates = c("1990-01-01",
                                         "2020-12-31"))

plot(Nguigmi, years = 2015:2020, met.var = "rain", cumulative = TRUE, climatology = TRUE)




library(dplyr)

Maiduguri.av <- Maiduguri %>%
  group_by(year) %>%
  summarize(
    n = n(),
    total_precipitation = sum(rain) )


library(ggplot2)
Maiduguri <- data.frame(Maiduguri.av)

library(dplyr)

Ndjamena.av <- Ndjamena %>%
  group_by(year) %>%
  summarize(
    n = n(),
    total_precipitation = sum(rain) )


library(ggplot2)
Ndjamena <- data.frame(Ndjamena.av)

library(dplyr)

Nguigmi.av <- Nguigmi %>%
  group_by(year) %>%
  summarize(
    n = n(),
    total_precipitation = sum(rain) )


library(ggplot2)
Nguigmi <- data.frame(Nguigmi.av)


library(dplyr)

Maroua.av <- Maroua %>%
  group_by(year) %>%
  summarize(
    n = n(),
    total_precipitation = sum(rain) )


library(ggplot2)
Maroua <- data.frame(Maroua.av)


ggplot(data = Nguigmi, aes(year, total_rain))+
         geom_line()+
  scale_x_continuous(breaks = c(2010, 2011, 2012,2013,2014,2015,2016,2017,2018,2019,2020))
  

ggplot()+
  geom_line(data = Nguigmi, aes(x=year, y = total_precipitation, col = "Nguigmi"))+
  geom_line(data = Maroua, aes(x=year, y = total_precipitation, col = "Maroua"))+
  geom_line(data = Maiduguri, aes(x=year, y = total_precipitation, col = "Maiduguri"))+
  geom_line(data = Ndjamena, aes(x=year, y = total_precipitation, col = "Ndjamena"))+
  labs(x = "Years") + 
  labs(y = "Annual Total Precipitation in mm")+
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()) 

ggsave("LakeSurface.jpg")
ggsave("LakeSurface.jpg", width = 18, height = 10, units = c("cm"), dpi = 800)

library(readxl)

c =read_xlsx("LakeChadSurfaceArea.xlsx")

library(ggplot2)

ggplot()+
  geom_line(data = c, aes(x=Year, y = SurfaceArea, col = "Surface Area(Km2)", xlab = "Trends of Lake Chad Surface Area in Km squared"))+
  scale_y_continuous(breaks = c(1000, 2000,3000, 4000,5000, 6000, 7000,8000,9000, 10000,11000,12000,13000,14000,15000))

library(readxl)
c =read_xlsx("SurfaceArea.xlsx")
plot(c)

ggplot(c, aes(x = Year, y = Surface))+
  geom_line(color ="darkgreen")

?read_xls


?scale_x_continuous
