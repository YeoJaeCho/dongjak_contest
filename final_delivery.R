install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)
deliver<-read_excel("C:/Users/조/Desktop/공모전/가구수별 배달이용.xlsx")
View(deliver)
str(deliver)

deliver$measure<-as.factor(deliver$measure)

plot(deliver$measure,deliver$pct)
ggplot(data=deliver, 
       aes(x=factor(measure),y=pct,
           group=Num,shape=Num,color=Num))+
  geom_line()+geom_point()+
  labs(title="가구 수 별 배달 앱 이용률",
       x="측정방법", y="배달 앱 이용률")+
  scale_x_discrete(limits=c("전혀 그렇지 않다","그렇지 않다","보통이다/그저 그렇다","그런편이다","매우그렇다"))




################
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
station_data3<-filter(station_data,호선==9)%>%select(역명,구주소)
station_data<-rbind(station_data1,station_data2,station_data3)
View(station_data)
install.packages("ggmap")
library(ggmap)
station_code<-geocode(station_data$구주소)
station_code_final<-cbind(station_data,station_code)

dj_map<-get_googlemap("숭실대학교",maptype="roadmap",zoom=13)
ggmap(dj_map)
ggmap(dj_map)+
  geom_point(data=market_code_final,aes(lon,lat),col="blue",size=2)+
  geom_text(data=market_code_final,aes(label=전통시장명,vjust=1),col="blue",size=4)+
  geom_point(data=station_code_final,aes(lon,lat),col="red",size=2)+
  geom_text(data=station_code_final,aes(label=역명,vjust=-1),size=5)


###########
metro<-read_excel("C:/Users/조/Desktop/공모전/Sangdo.xlsx")
View(metro)
sangdo<-filter(metro,역명=="노량진",구분=="하차")
View(sangdo)
sangdo6<-sangdo[20]
sangdo7<-sangdo[21]
sangdo<-sangdo6+sangdo7
str(sangdo)
mean(sangdo[,1])

################
install.packages("fpp2")
library(fpp2)
library(readxl)
library(dplyr)
sangdo <- read_excel("C:/Users/조/Desktop/공모전/Sangdo.xlsx")

str(sangdo)
sangdo1<- filter(sangdo,역명=="상도",구분=="하차")
sangdo1
str(sangdo1)
sangdo_time<-ts(sangdo1$"합 계",start=2020,frequency=365.25)
sangdo_time
autoplot(sangdo_time)

View(dongjak)

#############
metro<- read.csv("C:/Users/조/Desktop/공모전/서울시 지하철 호선별 역별 시간대별 승하차 인원 정보.csv")
library(dplyr)
View(metro)
heuksuk<-filter(metro,지하철역=="흑석(중앙대입구)")
dongjak41<-filter(metro,호선명=="4호선",지하철역=="동작(현충원)")
dongjak42<-filter(metro,호선명=="4호선",지하철역=="동작")
dongjak4<-rbind(dongjak41,dongjak42)
dongjak91<-filter(metro,호선명=="9호선",지하철역=="동작(현충원)")
dongjak92<-filter(metro,호선명=="9호선",지하철역=="동작")
dongjak9<-rbind(dongjak91,dongjak92)
soongsil1<-filter(metro,지하철역=="숭실대입구(살피재)")
soongsil2<-filter(metro,지하철역=="숭실대입구")
soongsil<-rbind(soongsil1,soongsil2)
noryangin1<-filter(metro,호선명=="경부선",지하철역=="노량진")
noryangin9<-filter(metro,호선명=="9호선",지하철역=="노량진")
nodeul<-filter(metro,지하철역=="노들")
sindaebang<-filter(metro,지하철역=="신대방삼거리")
jandseungbaegi<-filter(metro,지하철역=="장승배기")
sangdo<-filter(metro,지하철역=="상도")
isu41<-filter(metro,호선명=="4호선",지하철역=="총신대입구(이수)")
isu42<-filter(metro,호선명=="4호선",지하철역=="이수")
isu4<-rbind(isu41,isu42)
isu71<-filter(metro,호선명=="7호선",지하철역=="총신대입구(이수)")
isu72<-filter(metro,호선명=="7호선",지하철역=="이수")
isu7<-rbind(isu71,isu72)
namsung<-filter(metro,지하철역=="남성")
sadang2<-filter(metro,호선명=="2호선",지하철역=="사당")
sadang4<-filter(metro,호선명=="4호선",지하철역=="사당")
boramae<-filter(metro,지하철역=="보라매")


heuksuk<-heuksuk[1:27,4:27]
dongjak4<-dongjak4[1:27,4:27] 
dongjak9<-dongjak9[1:27,4:27] 
soongsil<-soongsil[1:27,4:27]
noryangin1<-noryangin1[1:27,4:27] 
noryangin9<-noryangin9[1:27,4:27]
nodeul<-nodeul[1:27,4:27]
sindaebang<-sindaebang[1:27,4:27]
jandseungbaegi<-jandseungbaegi[1:27,4:27]
sangdo<-sangdo[1:27,4:27]
isu4<-isu4[1:27,4:27] 
isu7<-isu7[1:27,4:27]
namsung<-namsung[1:27,4:27]
sadang2<-sadang2[1:27,4:27] 
sadang4<-sadang4[1:27,4:27] 
boramae<-boramae[1:27,4:27]


str(sadang2)

total<-heuksuk+dongjak4+dongjak9+soongsil+nodeul+sindaebang+jandseungbaegi+sangdo+namsung+sadang2+sadang4+boramae+isu4+isu7+noryangin1+noryangin9

View(total)


x1<-total[1,]
View(x1)
x2<-total[2,]
View(x2)
x3<-total[3,]
View(x3)
x4<-total[4,]
View(x4)
x5<-total[5,]
View(x5)
x6<-total[6,]
View(x6)
x7<-total[7,]
View(x7)
x8<-total[8,]
View(x8)
x9<-total[9,]
View(x9)
x10<-total[10,]
View(x10)
total[11,]
View(total[11,])
x12<-total[12,]
View(x12)
x13<-total[13,]
View(x13)
x14<-total[14,]
View(x14)
x15<-total[15,]
View(x15)
x16<-total[16,]
View(x16)
x17<-total[17,]
View(x17)
x18<-total[18,]
View(x18)
x19<-total[19,]
View(x19)
x20<-total[20,]
View(x20)
x21<-total[21,]
View(x21)
x22<-total[22,]
View(x22)
x23<-total[23,]
View(x23)
x24<-total[24,]
View(x24)
x25<-total[25,]
View(x25)
x26<-total[26,]
View(x26)
x27<-total[27,]
View(x27)

vec<-cbind(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27)

a<-cbind(x1,x2,x3,x4,x5)
b<-cbind(x6,x7,x8,x9,x10)
c<-cbind(total[11,],x12,x13,x14,x15)
d<-cbind(x16,x17,x18,x19,x20)
e<-cbind(x21,x22,x23,x24,x25,x26,x27)


vec<-cbind(a,b,c,d,e)  
View(vec)

install.packages("fpp2")
library(fpp2)

vec<-t(vec)

kk<-ts(vec, start=2017, frequency=365)
autoplot(kk)

?ts

##############
install.packages("readxl")
library(readxl)
deliver<-read_excel("C:/Users/조/Desktop/공모전/전체 배달앱 이용률.xlsx")
View(deliver)
str(deliver)
install.packages("ggplot2")
library(ggplot2)
deliver$measure<-as.factor(deliver$measure)

plot(deliver$measure,deliver$pct)
ggplot(deliver,aes(x=factor(measure),y=pct))+geom_line()

ggplot(deliver,aes(x=measure,y=pct,fill=measure))+geom_col()+scale_x_discrete(limits=c("전혀 그렇지 않다","그렇지 않다","보통이다/그저 그렇다","그런편이다","매우그렇다"))



#################
library(readxl)
floation<-read_excel("C:/Users/조/Desktop/공모전/Floating_Population_2001.xlsx")
View(floation)


############
View(total[,15:16])
View(total[,15]+total[,16])


############
floation<-read_excel("C:/Users/조/Desktop/공모전/상관분석.xlsx")
View(floation)
cor.test(floation$floation,floation$subway,method = "pearson")
plot(floation$floation,floation$subway)

floation<-floation[,2:3]
library(psych)
pairs.panels(floation) 

l<-lm(floation$floation~floation$subway)
summary(l)

############
View(heuksuk)
heuksuk_day<-heuksuk/31
View(heuksuk_day)
heuksuk_68<-heuksuk_day[,15:16]
heuksuk_sum<-heuksuk_68[,1]+heuksuk_68[,2]
mean(heuksuk_sum,2)*0.26

View(nodeul)
nodeul_day<-nodeul/31
View(nodeul_sum)
nodeul_68<-nodeul_day[,15:16]
nodeul_sum<-nodeul_68[,1]+nodeul_68[,2]
mean(nodeul_sum,2)*0.26

View(jandseungbaegi)
jandseungbaegi_day<-jandseungbaegi/31
View(jandseungbaegi_sum)
jandseungbaegi_68<-jandseungbaegi_day[,15:16]
jandseungbaegi_sum<-jandseungbaegi_68[,1]+jandseungbaegi_68[,2]
mean(jandseungbaegi_sum,2)*0.26

View(sangdo)
sangdo_day<-sangdo/31
View(sangdo_sum)
sangdo_68<-sangdo_day[,15:16]
sangdo_sum<-sangdo_68[,1]+sangdo_68[,2]
mean(sangdo_sum,2)*0.26

View(sindaebang)
sindaebang_day<-sindaebang/31
View(sindaebang_sum)
sindaebang_68<-sindaebang_day[,15:16]
sindaebang_sum<-sindaebang_68[,1]+sindaebang_68[,2]
mean(sindaebang_sum,2)*0.26

View(isu4)
isu4_day<-isu4/31
View(isu4_sum)
isu4_68<-isu4_day[,15:16]
isu4_sum<-isu4_68[,1]+isu4_68[,2]
mean(isu4_sum,2)*0.26

View(isu7)
isu7_day<-isu7/31
View(isu7_sum)
isu7_68<-isu7_day[,15:16]
isu7_sum<-isu7_68[,1]+isu7_68[,2]
mean(isu7_sum,2)*0.26

1365.218+904.0955

View(noryangin1)
noryangin1_day<-noryangin1/31
View(noryangin1_sum)
noryangin1_68<-noryangin1_day[,15:16]
noryangin1_sum<-noryangin1_68[,1]+noryangin1_68[,2]
mean(noryangin1_sum,2)*0.26

View(noryangin9)
noryangin9_day<-noryangin9/31
View(noryangin9_sum)
noryangin9_68<-noryangin9_day[,15:16]
noryangin9_sum<-noryangin9_68[,1]+noryangin9_68[,2]
mean(noryangin9_sum,2)*0.26

620.1587+1436.928



############
library(readxl)
demand<-read_excel("C:/Users/조/Desktop/공모전/수요공급.xlsx")
View(demand)
lm<-lm(supply~demand,data=demand)
plot(demand$demand,demand$supply,pch=16,xlab="예비소비자",ylab="물품보관함",main="예비소비자 수에 따른 물품보관함 개수",cex=1,col="red")
abline(lm,col="blue")
text(x =demand$demand, y =demand$supply, labels =demand$station, pos = 3, cex = 0.5)
summary(lm)



###############
library(readxl)
deliver<-read_excel("C:/Users/조/Desktop/공모전/전체 배달앱 이용률.xlsx")
View(deliver)
str(deliver)

deliver$measure<-as.factor(deliver$measure)

plot(deliver$measure,deliver$pct)
library(ggplot2)
ggplot(data=deliver, 
       aes(x=factor(measure),y=pct,
           group=total,shape=total,color="total"))+
  geom_line(col="blue")+geom_point(col="blue")+
  labs(title="배달 앱 이용률",
       x="측정방법", y="배달 앱 이용률")+
  scale_x_discrete(limits=c("전혀 그렇지 않다","그렇지 않다","보통이다/그저 그렇다","그런편이다","매우그렇다"))

ggplot(deliver,aes(x=measure,y=pct),title="배달앱 이용률")+geom_col()+scale_x_discrete(limits=c("전혀 그렇지 않다","그렇지 않다","보통이다/그저 그렇다","그런편이다","매우그렇다"))
