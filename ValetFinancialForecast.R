data <- read.csv('ValetFinancialForecast.csv', header = T)
data[,1] <- as.character(data[,1])
data$TotalEmployees <- data$Valets + data$Cashiers + data$LaneAssistants
head(data)

library(reshape2)
data.m <- melt(data, id.cars='Hour', measure.vars=c('Valets', 'Cashiers', 'LaneAssistants'))
library(ggplot2)
ggplot(data.m) + 
  theme_minimal() +
  geom_bar(stat = 'identity', aes(x=Hour, y=value, fill = variable)) +
  ggtitle('Staffing Level by Hour') +
  scale_fill_brewer(palette = 'Set2', direction = 1) +
  labs(y = 'Total Employees On Duty', x = 'Hour') +
  guides(fill=guide_legend(title="Job Type"))+
  scale_x_discrete(labels=c('7am', '8am', '9am','10am','11am','12pm','1pm','2pm','3pm','4pm','5pm', '6pm')) + 
  theme(text = element_text(color = "gray20"),
        axis.text = element_text(face = "italic"),
        axis.ticks.y = element_blank(),
        axis.line = element_line(color = "gray40", size = 0.5),
        axis.line.y = element_blank(),
        panel.grid.major = element_line(color = "gray50", size = 0.5),
        panel.grid.major.x = element_blank(),
        plot.title = element_text(hjust = 0.6, face = 'bold', family = 'Times', size = 18),
        axis.title.y=element_text(size=12, face = 'bold', family = 'Times'),
        axis.title.x=element_text(size=12, face = 'bold', family = 'Times'))
