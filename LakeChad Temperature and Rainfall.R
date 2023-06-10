
library(apsimx)
library(ggplot2)
library(cowplot)
my_palette <- colorRampPalette(c("grey", "deepskyblue4"))(11)

Maiduguri <- get_power_apsim_met(lonlat = c(13.15, 11.83), 
                            dates = c("2010-01-01","2020-12-31"))

Maiduguri


# Create the plot with color palette
a <- plot(Maiduguri, years = 2010:2020, climatology = TRUE) +
  labs(title = "Maiduguri, Nigeria") +
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values = my_palette)

ggsave("Maiduguri.svg", width = 30, height = 20, units = c("cm"), dpi =1500)

Nguigmi <- get_power_apsim_met(lonlat = c(13.11, 14.25), 
                                 dates = c("2010-01-01","2020-12-31"))

Nguigmi


# Create the plot with color palette
b <- plot(Nguigmi, years = 2010:2020, climatology = TRUE) +
  labs(title = "Nguigmi, Niger") +
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values = my_palette)
ggsave("Nguigmi.svg", width = 30, height = 20, units = c("cm"), dpi =1500)


Ndjamena <- get_power_apsim_met(lonlat = c(15.05, 12.14), 
                               dates = c("2010-01-01","2020-12-31"))

Ndjamena

my_palette <- colorRampPalette(c("grey", "deepskyblue4"))(11)
# Create the plot with color palette
c <- plot(Ndjamena, years = 2010:2020, climatology = TRUE) +
  labs(title = "Ndjamena, Chad") +
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values = my_palette)
ggsave("Ndjamena.svg", width = 30, height = 20, units = c("cm"), dpi =1500)

Maroua <- get_power_apsim_met(lonlat = c(14.32, 10.59), 
                                dates = c("2010-01-01","2020-12-31"))

Maroua

my_palette <- c("#0570B0", "#3690C0", "#74A9CF", "#A6BDDB", "#D0D1E6", "#F1EEF6", "#BDC9E1", "#74A9CF", "#2B8CBE", "#045A8D", "#023858")
my_palette <- colorRampPalette(c("grey", "deepskyblue4"))(11)
# Create the plot with color palette
d <- plot(Maroua, years = 2010:2020, climatology = TRUE) +
  labs(title = "Maroua, Cameroon") +
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_color_manual(values = my_palette)

join <- plot_grid(a,b,c,d)
ggsave("all.svg", join,  width = 30, height = 20, units = c("cm"), dpi =1500)



#Temperature related graph
# Load required libraries
library(readxl)
library(ggplot2)
library(tidyr)

my_palette <- colorRampPalette(c("yellow", "red"))(4)
# Read the data from the Excel file
data <- read_excel("Crain4cities.xlsx")

# Reshape the data from wide to long format
data_long <- tidyr::pivot_longer(data, cols = -YEAR, names_to = "City", values_to = "Rainfall")

# Create the column chart
ggplot(data_long, aes(x = YEAR, y = Rainfall, fill = City)) +
  geom_col +
  labs(title = "The Annual total precipitation for specific neighboring cities",
       x = "Year",
       y = "Rainfall (mm)") +
 
theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  #scale_fill_manual(values = my_palette)+
  theme(plot.title = element_text(hjust = 0.5))
ggsave("rain.svg", width = 20, height = 15, units = c("cm"), dpi =600)


# Reshape the data from wide to long format
data_long <- tidyr::pivot_longer(data, cols = -YEAR, names_to = "City", values_to = "Rainfall")

# Create the stacked column chart
ggplot(data_long, aes(x = YEAR, y = Rainfall, fill = City)) +
  geom_col() +
  labs(title = "The Annual total precipitation for specific neighboring cities",
       x = "Year",
       y = "Rainfall (mm)") +
  
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  #scale_fill_manual(values = my_palette)+
  theme(plot.title = element_text(hjust = 0.5))
ggsave("rain.svg", width = 20, height = 15, units = c("cm"), dpi =600)
