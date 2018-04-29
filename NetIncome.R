data <-read.csv('ValetFinancialForecast.csv', header = T)
data[,1] <- as.character(data[,1])
data$Shands <- round(data$NetIncome*0.4,2)
data$UF <- round(data$NetIncome*0.6,2)
totalRevenue <- sum(data$Revenue)

ShandsTotalDailyLoss <- sum(data$Shands)   # = -$184.20
UFTotalDailyLoss <- sum(data$UF)           # = -$276.34

myColors <- c('#4FC3F7', '#01579B')

library(reshape2)
data.m <- melt(data, id.vars = 'Hour', measure.vars = c('Shands', 'UF'))
library(ggplot2)
ggplot(data.m) + 
  theme_minimal() + 
  geom_bar(stat = 'identity', aes(x=Hour, y=value, fill = variable)) +
  geom_text(aes(x=Hour, y=value, label=ifelse(value==0, "",value), group=variable), 
            position = position_stack(vjust = 0.5), size=3, family='Times') +
  ggtitle('Net Income From Dental Lot Valet For UF & Shands by Hour') +
  
  #scale_fill_brewer(palette = 'Reds', direction = 1) +
  scale_fill_manual(values = c('#D45B1F', '#F9C861')) +
  labs(y = 'Net Income ($)', x = 'Hour') +
  
  guides(fill=guide_legend(title="Organization : ")) +
  
  scale_x_discrete(labels=c('7am', '8am', '9am','10am','11am','12pm','1pm','2pm','3pm','4pm','5pm', '6pm')) + 
  theme(text = element_text(color = "gray20"),
        axis.text = element_text(face = "italic"),
        axis.ticks.y = element_blank(),
        axis.line = element_line(color = "gray40", size = 0.5),
        axis.line.y = element_blank(),
        panel.grid.major = element_line(color = "gray50", size = 0.5),
        panel.grid.major.x = element_blank(),
        plot.title = element_text(hjust = 0.5, face = 'bold', family = 'Times', size = 18),
        legend.position="bottom",
        axis.title.y=element_text(size=12, face = 'bold', family = 'Times'),
        axis.title.x=element_text(size=12, face = 'bold', family = 'Times'))
