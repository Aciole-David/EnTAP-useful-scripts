#Create plots for concatenated/summarized EnTAP figures
#Ms. David Aciole Barbosa
#Nucleo Integrado de Biotecnologia - NIB
#Universidade de Mogi das Cruzes - UMC
#Mogi das Cruzes, SP, Brasil

####Run once in every folder containing figure data####
library(ggplot2)

files <- list.files(path=".", pattern="merged_summ_.*.txt", full.names=F, recursive=FALSE)

#read tables; zero counts become NA
for (i in files){
  table <- paste("t", i, sep = ".")
  assign(table, value = read.table(i, sep = "\t", header = F, na.strings = "0"))
}

objs<-as.list(mget(ls(pattern = ".*.txt")))

#remove NAs
for (i in 1:length(objs)){
  prefix<- paste("t", names(objs)[[i]], sep = ".")
  assign(prefix, objs[[i]][complete.cases(objs[[i]]),])
}

objs2<-as.list(mget(ls(pattern = "t.t.")))

#Create plot objects
for (i in 1:length(objs2)){
  prefix<- paste("plot", names(objs2)[[i]], sep = ".")
  assign(prefix, ggplot(data=as.data.frame(objs2[[i]]), aes(x=V2, y=reorder(V1,V2), fill=V2)) + 
           xlab("count") + 
           ylab("") +
           scale_fill_gradient(low = "green", high = "blue", name = "amount") + 
           geom_bar(stat="identity") + 
           geom_label(aes(label=V2), fill = "white", color="black", size=3.5, fontface = "bold", hjust=0) +
           theme(text=element_text(size=15, face = "bold")) + 
           scale_x_continuous(expand = c(0, 0), limits = c(0,max(objs2[[i]][["V2"]])+(max(objs2[[i]][["V2"]])/11))) + 
           coord_cartesian(clip = "off") + 
           facet_grid(V3~., drop = T, scales = "free",space = "free", switch = "y"))
}

objs3<-as.list(mget(ls(pattern = "plot.*")))

#save plots as pdf
pdf(file = "barplot.pdf", width = 15, height = 15)
for (i in 1:length(objs3)){
  pretitle1<-gsub("plot.t.t.merged_summ_", "", names((objs3)[i]))
  pretitle<-gsub("_bar.*.txt", "", pretitle1)
  title<-gsub(".txt", "", pretitle)
  
  print((objs3)[[i]] + ggtitle("Top 5 GO Annotations"))
}
dev.off()

#remove all previous objects
rm(list=ls())

#clear console
cat("\f")
