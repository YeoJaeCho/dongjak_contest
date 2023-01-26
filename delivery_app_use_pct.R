#####
deliver<-read_excel("C:/Users/조/Desktop/공모전/delivery_per_household.xlsx")
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

######
deliver2<-read_excel("C:/Users/조/Desktop/공모전/delivery_per_age.xlsx")
View(deliver)
str(deliver)

deliver2$measure<-as.factor(deliver2$measure)

plot(deliver2$measure,deliver2$pct)
ggplot(data=deliver2, 
       aes(x=factor(measure),y=pct,
           group=age,shape=age,color=age))+
  geom_line()+geom_point()+
  labs(title="연령별 배달 앱 이용률",
       x="측정방법", y="배달 앱 이용률")+
  scale_x_discrete(limits=c("전혀 그렇지 않다","그렇지 않다","보통이다/그저 그렇다","그런편이다","매우그렇다"))
