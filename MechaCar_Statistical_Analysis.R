library(dplyr)
MechaCar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

mpg_m <-lm(mpg ~ vehicle_length + vehicle_weight +	spoiler_angle	+ ground_clearance + AWD , data =MechaCar_table)
summary(mpg_m)

Suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 
total_summary <- Suspension_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
lot_summary <- Suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI),.groups ='keep')

t.test(Suspension_table$PSI,mu=1500)
t.test(subset(Suspension_table,Manufacturing_Lot=="Lot1")$PSI,mu=1500)
t.test(subset(Suspension_table,Manufacturing_Lot=="Lot2")$PSI,mu=1500)
t.test(subset(Suspension_table,Manufacturing_Lot=="Lot3")$PSI,mu=1500)
