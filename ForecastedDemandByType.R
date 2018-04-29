library(grid)
library(ggplot2)
data <- read.csv('ForecastedDemandByType.csv', header = T, colClasses = c('character', 'factor', 'numeric'))

ggplot(data, aes(x = Hour, y=Amount, fill = Type)) +
  geom_bar(stat = 'identity') + 
  theme_minimal() + 
  ggtitle('Forecasted Dental Valet Demand By Arrival/Departure') +
  labs(y = 'Total Demand', x = 'Hour') +
  #scale_fill_brewer(palette = 7, direction = 1) +
  scale_fill_manual(values = c('#F8B195','#355C7D')) +
  guides(fill=guide_legend(title="Type : ")) +
  scale_x_discrete(labels=c('7am', '8am', '9am','10am','11am','12pm','1pm','2pm','3pm','4pm','5pm')) + 
  theme(text = element_text(color = "gray20"),
        axis.text = element_text(face = "italic"),
        axis.ticks.y = element_blank(),
        axis.line = element_line(color = "gray40", size = 0.5),
        axis.line.y = element_blank(),
        panel.grid.major = element_line(color = "gray50", size = 0.5),
        panel.grid.major.x = element_blank(),
        plot.title = element_text(hjust = 0.6, face = 'bold', family = 'Times', size = 18),
        legend.position="bottom",
        axis.title.y=element_text(size=12, face = 'bold', family = 'Times'),
        axis.title.x=element_text(size=12, face = 'bold', family = 'Times'))

