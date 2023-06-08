library(ggplot2)

# Define the search phases and corresponding article counts
search_phases <- c("Lake Chad", "Lake Chad + food or water", "Lake Chad + food or water + climate + English only", "Lake Chad + food or water + climate + Relevance to Work + Duplications")
webOfScience_counts <- c(659, 220, 85, 85)
scopus_counts <- c(592, 206, 78, 18)

# Create a data frame for the search phases and counts
data <- data.frame(SearchPhase = search_phases, WebOfScience = webOfScience_counts, Scopus = scopus_counts)

# Generate the graph
graph <- ggplot(data, aes(x = SearchPhase)) +
  geom_bar(aes(y = WebOfScience, fill = "Web of Science"), stat = "identity", position = "dodge") +
  geom_text(aes(y = WebOfScience, label = WebOfScience), vjust = -0.9, size = 4, position = position_dodge(width = 0.9)) +
  geom_bar(aes(y = Scopus, fill = "Scopus"), stat = "identity", position = "dodge") +
  geom_text(aes(y = Scopus, label = Scopus), vjust = -0.5, size = 4, position = position_dodge(width = 0.9)) +
  labs(x = "Search Phase", y = "Article Count", fill = "Database") +
  scale_fill_manual(values = c("Web of Science" = "blue", "Scopus" = "red")) +
  theme_minimal()

# Display the graph
print(graph)
