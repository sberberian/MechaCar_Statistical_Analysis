#import dplyr
library(tidyverse)

#import and read MechaCar CSV
mecha_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

#linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_df) 

# summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_df)) 

#import and read Suspension Coil CSV
suspension_df <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors=F)

#create summary table with multiple columns
total_summary <- suspension_df %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 

#create grouped summary 
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 

#randomly sample 50 data points
sample_table <- suspension_df %>% sample_n(50) 

#compare sample of all lots versus population means
t.test(log10(sample_table$PSI),mu=mean(log10(suspension_df$PSI))) 

#compare sample of Lot 1 versus population means
t.test(log10(subset(suspension_df, Manufacturing_Lot == 'Lot1')$PSI),mu=mean(log10(suspension_df$PSI))) 

#compare sample of Lot 2 versus population means
t.test(log10(subset(suspension_df, Manufacturing_Lot == 'Lot2')$PSI),mu=mean(log10(suspension_df$PSI))) 

#compare sample of Lot 3 versus population means
t.test(log10(subset(suspension_df, Manufacturing_Lot == 'Lot3')$PSI),mu=mean(log10(suspension_df$PSI))) 

