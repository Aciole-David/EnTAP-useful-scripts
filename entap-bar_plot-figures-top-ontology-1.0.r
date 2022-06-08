#Create plots for concatenated/summarized EnTAP figures
#Ms. David Aciole Barbosa
#Nucleo Integrado de Biotecnologia - NIB
#Universidade de Mogi das Cruzes - UMC
#Mogi das Cruzes, SP, Brasil

####Run once in every folder containing figure data####
library(ggplot2)
library(tidyverse)
library(grid)
library(scales)

#rename the files as "go_merge.txt"

files <- list.files(path=".", pattern="merge.*.txt", full.names=F, recursive=FALSE)

#read tables; zero counts become NA
for (i in files){
  table <- paste("t", i, sep = ".")
  assign(table, value = read.table(i, sep = "\t", header = F, skip = 1,na.strings = "0"))
}

#annotate GO terms
library(GO.db)
t.go_merge.txt$V4=Term(as.character(t.go_merge.txt$V1))
t.go_merge.txt$V4=if_else(is.na(t.go_merge.txt$V4),
        true = "none", false = t.go_merge.txt$V4)
t.go_merge.txt$V5=paste(t.go_merge.txt$V1,t.go_merge.txt$V4,sep = ";")

objs<-as.list(mget(ls(pattern = ".*.txt")))


#remove NAs
for (i in 1:length(objs)){
  prefix<- paste("t", names(objs)[[i]], sep = ".")
  assign(prefix, objs[[i]][complete.cases(objs[[i]]),])
}

objs2<-as.list(mget(ls(pattern = "t.t.")))

#Create plot objects
for (i in 1:length(objs2)){
  prefix<-paste("plot",names(objs2)[[i]],sep=".")
  assign(prefix,ggplot(data=as.data.frame(objs2[[i]]),aes(x=V2,y=reorder(V5,V2),fill=V3)) + 
           theme(legend.position="none") + 
           xlab("Transcripts") + 
           ylab('') +
           #scale_fill_gradient(low = "green", high = "blue", name = "count") + 
           geom_bar(stat="identity") + 
           geom_label(aes(label=V2),fill="white",color="black",size=3, fontface="bold",hjust=0,lineheight=2) +
           theme(text=element_text(size=11,face="bold")) + 
           scale_x_continuous(expand=c(0, 0),limits=c(0,max(objs2[[i]][["V2"]])+(max(objs2[[i]][["V2"]])/11))) + 
           coord_cartesian(clip = "off") + 
           facet_grid(V3~.,drop=T,scales="free",space="free",switch="y") + 
           theme(axis.text.y = element_text(hjust = 0),strip.placement="outside",panel.spacing=unit(0.1,"lines")))
}

objs3<-as.list(mget(ls(pattern="plot.*")))

#save plots as pdf (adjust pdf parameters as needed)
pdf(file = "barplot.pdf", width = 9, height = 8,
    
    #MANDATORY EDIT:
    title = "ARTICLE INFO; AUTHOR et al, YEAR")

for (i in 1:length(objs3)){
  pretitle1<-gsub("plot.t.t.merged_summ_", "", names((objs3)[i]))
  pretitle<-gsub("_bar.*.txt", "", pretitle1)
  title<-gsub(".txt", "", pretitle)
  
  p<-print((objs3)[[i]] + ggtitle("Top 10 GO Annotations")+
             theme(plot.title = element_text(size = 12)))
    
  
#fill color for facet strips
g <- ggplot_gtable(ggplot_build(p))
stripl <- which(grepl('strip-l', g$layout$name))
fills <- c(hue_pal()(length(unique(objs2[[i]][["V3"]]))))
k <- 1
for (i in stripl) {
  j <- which(grepl('rect', g$grobs[[i]]$grobs[[1]]$childrenOrder))
  g$grobs[[i]]$grobs[[1]]$children[[j]]$gp$fill <- fills[k]
  k <- k+1
}
grid.draw(g)
}
dev.off()

#remove all previous objects
rm(list=ls())

#clear console
cat("\f")
