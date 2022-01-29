lapply(c("ggplot2","broom", "dplyr"),require, character.only = TRUE)
setwd("G:/Samid work/Pakistan/PlotsX")   #in case we want to save any of the plots
getwd()

# want to use code for column name rather than the overly descriptive 
header <- scan("G:/Samid work/Pakistan/WorldBank_PakistanAll_Updated2.csv", nlines = 1, what = character(),sep = ",")
data <- read.csv("G:/Samid work/Pakistan/WorldBank_PakistanAll_Updated2.csv", skip = 2, header = FALSE)
names(data) <- header
glimpse(data)


df1 <- data %>% 
  mutate(GovSpendtoGDP= GovExpen/TotalGDP)

mlr1 <-lm(MilitaryExpenPercent~Corruption+GovSpendtoGDP+GDPerCap+Secondaryenroll+UrbanPopGrowth+DependencyRatio+Total_MilitaryPersonnel,data=df1) 
tidy(mlr1)
glance(mlr1)
#write.csv(tidy, "G:/Samid work/Pakistan/regressionOutput.csv")  #export regression results
augment <- augment(mlr1)
augment


############Plots###############
ggplot(data = augment) + 
  geom_point(mapping = aes(x = .fitted, y = MilitaryExpenPercent),colour="Red3")+
  labs(title ="Actual vs Fitted",
       subtitle = "n= 14, df=6 ,    R^2=0.897", 
       caption ="WIP: See Gupta et al(2001) for information regarding empirical specification",
       x="Fitted",
       y= "Actual")+
  theme(plot.caption = element_text(hjust = 0))
ggsave("Actual_vs_fitted.png")


#residuals by year
ggplot(data = augment) + 
  geom_point(mapping = aes(x = .rownames, y = .resid),colour="Purple4")+
  labs(title ="Residuals by year",
       subtitle = "Overall regression F= 7.45,   p-value =0.013",
       caption = "WIP, need to confirm years",
       x="Rownames",
       y= "Residual")+
  theme(plot.caption = element_text(hjust = 0))
ggsave("Residuals_by_year.png")

