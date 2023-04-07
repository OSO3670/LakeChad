library(readxl)
lake_chad <- read_excel(LChadSA.xlsx)

# Plot the data as a line graph with the year on the x-axis and the surface area on the y-axis
library(ggplot2)
ggplot(lake_chad, aes(x = Year, y = Surface_Area)) +
  geom_line(color = "blue", size = 1.2) +
  geom_point(color = "blue", size = 3) +
  xlab("Year") +
  ylab("Surface Area (km2)") +
  ggtitle("Trends in Lake Chad Water Surface Area")