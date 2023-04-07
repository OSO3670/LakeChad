# First, we'll create a data frame with the population data for all countries
# In this example, I'll use the World Bank data for the population of all countries
# You can replace this with data from any other source that you prefer

library(tidyverse)
library(ggthemes)
install.packages("ggthemes")

population_data <- read_csv("C:/")

population_data <- read_csv("rural.csv")
data_filtered <- population_data[population_data$`Country Code` %in% c("BRN", "IDN", "KHM", "LAO","MMR", "MYS", "PHL", "SGP",  "THA", "TLS", "VHM", "USA"),]

tidy_data <- data_filtered %>%
  pivot_longer(cols = `1960`:`2021`, names_to = "Year", values_to = "GDP")
# Create separate line plots for each country

tidy_data <- tidy_data %>%
  mutate(Year = as.numeric(Year)) 

my_palette <- colorRampPalette(c("#FFEDA0", "#FEB24C", "#013220", "#FC4E2A", "#E31A1C", "#BD0026", "#800026", "#666666", "#252525", "#000000", "#0000FF"))

ggplot(tidy_data, aes(x = Year, y = GDP, color = `Country Name`)) +
  geom_point (size = 2)+ 
  scale_color_manual(values = my_palette(11))+
  labs(x = "Year", y = "%",
       title = "Population Growth of Selected Countries",
       caption = "Data Source: World Bank")+ 
  scale_x_continuous(limits = c(1960, 2021), breaks = seq(1960, 2021, 20))+ 
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))


ggsave("rural.jpg", width = 20, height = 10, units = c("cm"), dpi =1200)



read.csv("Pop.csv")

library(tidyverse)
library(ggthemes)
install.packages("ggthemes")

population_data <- read_csv("Pop.csv")
data_filtered <- population_data[population_data$`Country Code` %in% c("NGA", "NER", "CMR", "TCD"),]

tidy_data <- data_filtered %>%
  pivot_longer(cols = `1960`:`2021`, names_to = "Year", values_to = "Population")
# Create separate line plots for each country

ggplot(tidy_data, aes(x = Year, y = Population, color = `Country Name`)) +
  geom_line(size = 1) +
  scale_color_brewer(palette = "Set1") +
  labs(x = "Year", y = "Population",
       title = "Lake Chad Basin Countries(1960-2021)") +
  scale_x_continuous(limits = c(1960, 2021), breaks = seq(1960, 2021, 20)) +
  theme_economist()+
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Population.jpg", width = 30, height = 20, units = c("cm"), dpi =800)