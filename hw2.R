##套件
library(quanteda)
library(dplyr)
library(rJava)
library(rmmseg4j)

##文本
data<-read.csv("bda2018.csv",stringsAsFactors = F)
colnames(data)
data1<-data$內容

##前處理
data2<-gsub("（","",data1)
data2<-gsub("）","",data2)
data2<-gsub("[0-9a-zA-Z]+?","",data2)###去除阿拉伯數字和英文
data2<-gsub("[０-９]+?","",data2)

##分組
data2<-data.frame(data2)
a1<-data2[grep("鴻海",data2$data2),]

a2<-as.character(a1)

##
b1<-mmseg4j(a2)

c1<-tokens(b1,what="fastestword",ngram=1:6,concatenator="")


##dtm
d1<-dfm(c1)
d1[20:25,1:10]

##排序
d11<-dfm_sort(d1)
d11[1:5,1:10]
nfeat(d11)



e1<-textstat_dist(d11,selection = "鴻海", margin = "features")

write.csv(e1,"hw2-1.csv")

