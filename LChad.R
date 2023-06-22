library(readxl)
lake_chad <- read_excel("LChadSA.xlsx")
library(scales)
library(gridExtra)
# Plot the data as a line graph with the year on the x-axis and the surface area on the y-axis
library(ggplot2)

# Read in the data
lake_chad <- read_excel("LChadSA.xlsx")

# Create a new column to indicate the time period (before or after 1996)
lake_chad$Time_Period <- ifelse(lake_chad$Year < 1996, "Before 1996", "After 1996")

# Define the breaks and limits for the y-axis scales
breaks_1 <- seq(0, 20000, by = 5000)
limits_1 <- c(0, 20000)

breaks_2 <- seq(1200, 1400, by = 50)
limits_2 <- c(1200, 1400)

# Log-transform the Surface Area column
lake_chad$SA_Log <- log(lake_chad$SurfaceArea)

# Create two separate plots with different y-axis scales
p1 <- ggplot(lake_chad[lake_chad$Year < 1996, ], aes(x = Year, y = SurfaceArea)) +
  geom_line(color = "blue", size = 1.2) +
  geom_point(color = "blue", size = 3) +
  xlab("Year") +
  ylab(expression("Surface Area (km"^"2"~")")) +
  ggtitle("Trends in Lake Chad Water Surface Area (Before 1996)") +
  scale_y_continuous(
    limits = limits_1,
    breaks = breaks_1,
    labels = function(x) ifelse(x >= 10000, format(x, big.mark = ","), as.character(x)),
    expand = c(0, 0)
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

p2 <- ggplot(lake_chad[lake_chad$Year >= 1996, ], aes(x = Year, y = SurfaceArea)) +
  geom_line(color = "darkred", size = 1.2) +
  geom_point(color = "blue", size = 3) +
  xlab("Year") +
  ylab(expression("Surface Area (km"^"2"~")")) +
  ggtitle("Trends in Lake Chad Water Surface Area (After 1996)") +
  scale_y_continuous(
    limits = limits_2,
    breaks = breaks_2,
    labels = function(x) ifelse(x >= 10000, format(x, big.mark = ","), as.character(x)),
    expand = c(0, 0)
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# Arrange the plots side-by-side
a <- grid.arrange(p1, p2, ncol = 2)

ggsave("lakechadsurface.svg",  a, width = 30, height = 20, units = c("cm"), dpi =1500)



scale_y_continuous(labels = scales::comma_format())
