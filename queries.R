library(DBI)
library(RMySQL)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

#reto1
pop.esp=dbGetQuery(MyDataBase, "select * from CountryLanguage where Language='Spanish'")
class(pop.esp)
ggplot(pop.esp, aes(x=CountryCode, y=Percentage, fill=IsOfficial)) +
  geom_bar(stat="identity", position="dodge")+
  coord_flip()
#############