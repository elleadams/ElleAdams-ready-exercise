## ---- packages --------
#load needed packages. make sure they are installed.
library(here) #for data loading/saving
library(dplyr)
library(skimr)
library(ggplot2)

## ---- loaddata --------
#Path to data. Note the use of the here() package and not absolute paths
data_location <- here::here("data","processed-data","processeddata2.rds")
#load data
mydata <- readRDS(data_location)

## ---- table1 --------
summary_df = skimr::skim(mydata)
print(summary_df)
# save to file
summarytable_file = here("results","tables", "summarytable.rds")
saveRDS(summary_df, file = summarytable_file)

## ---- height --------
p1 <- mydata %>% ggplot(aes(x=Height)) + geom_histogram() 
plot(p1)
figure_file = here("results", "figures", "height-distribution.png")
ggsave(filename = figure_file, plot=p1) 

## ---- weight --------
p2 <- mydata %>% ggplot(aes(x=Weight)) + geom_histogram() 
plot(p2)
figure_file = here("results", "figures", "weight-distribution.png")
ggsave(filename = figure_file, plot=p2) 

## ---- fitfig1 --------
p3 <- mydata %>% ggplot(aes(x=Height, y=Weight)) + geom_point() + geom_smooth(method='lm')
plot(p3)
figure_file = here("results","figures", "height-weight.png")
ggsave(filename = figure_file, plot=p3) 

## ---- fitfig2 --------
p4 <- mydata %>% ggplot(aes(x=Height, y=Weight, color = Gender)) + geom_point() + geom_smooth(method='lm')
plot(p4)
figure_file = here("results","figures", "height-weight-stratified.png")
ggsave(filename = figure_file, plot=p4) 

## Height and Eye color boxplot
p5 <- ggplot(mydata, aes(x = `Eye Color`, y = Height)) + geom_boxplot()
plot(p5)

figure_file <- here::here("results", "figures", "eye-height-boxplot.png")
ggsave(filename = figure_file, plot = p5)

## Shoe size and weight scatterplot
p6 <- ggplot(mydata, aes(x = Weight, y = `Shoe Size`)) + geom_point()
plot(p6)

figure_file <- here::here("results", "figures", "size-weight-scatterplot.png")
ggsave(filename = figure_file, plot = p6)
# correlation doesn't equal causation, but this is a pretty nice relationship involving imaginary data..

