library("dplyr")
library("ggplot2")
library(tidyverse)



install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyverse")



incidence = read.csv("C:/Users/Aparna/Downloads/2020-10-28_incidents.csv", header = FALSE, stringsAsFactors = FALSE)
colnames(incidence) <- c("Date","Time","Incidence_Type","Location","Incidence_image")


ggplot(incidence, aes(x = Time, y = Incidence_Type)) +
geom_point()

ggplot(incidence, aes(x = Time, y = Incidence_Type, group = Incidence_Type, 
                                     shape = Incidence_Type, color = Incidence_Type)) + geom_line() + geom_point()


