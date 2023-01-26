install.packages("ggmap")
library(ggmap)
install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
googleAPIkey="AIzaSyDLCxGhHtt4PCmMWtRblVTXA64iSv5czu8"
register_google(googleAPIkey)
gg_seoul<-get_googlemap(center="seoul",maptype="roadmap")  #지도저장
ggmap(gg_seoul)  #지도그리기

geo_code<-geocode("동작구")
get_googlemap(center=as.numeric(geo_code),maptype="roadmap",zoom=13)%>%ggmap()+
  geom_point(data=geo_code,aes(x=lon,y=lat))
market_data<-read.csv("C:/Users/조/Desktop/공모전/서울시 전통시장 현황.csv")
View(market_data)
market_data<-filter(market_data,자치구명=="동작구")%>%select(전통시장명,주소명)
View(market_data)
market_data$주소명<-as.character(market_data$주소명)
market_code<-geocode(market_data$주소명)
market_code_final<-cbind(market_data,market_code)

station_data<-read_excel("C:/Users/조/Desktop/공모전/서울교통공사 역사 주소 현황_2018.xlsx")
station_data1<-filter(station_data,호선==4)%>%select(역명,구주소)
station_data2<-filter(station_data,호선==7)%>%select(역명,구주소)
station_data<-rbind(station_data1,station_data2)
View(station_data)
install.packages("ggmap")
library(ggmap)
station_code<-geocode(station_data$구주소)
station_code_final<-cbind(station_data,station_code)

dj_map<-get_googlemap("숭실대학교",maptype="roadmap",zoom=14)
ggmap(dj_map)
ggmap(dj_map)+
  geom_point(data=market_code_final,aes(lon,lat),col="red",size=2)+
  geom_text(data=market_code_final,aes(label=전통시장명,vjust=-1),size=2.5)+
  geom_point(data=station_code_final,aes(lon,lat),col="blue",size=2)+
  geom_text(data=station_code_final,aes(label=역명,vjust=-1),size=4)