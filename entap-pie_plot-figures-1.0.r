#Create plots for concatenated/summarized EnTAP figures
#Ms. David Aciole Barbosa
#Nucleo Integrado de Biotecnologia - NIB
#Universidade de Mogi das Cruzes - UMC
#Mogi das Cruzes, SP, Brasil

####Run once in every folder containing figure data####
library(ggplot2)
library(ggrepel)
library(randomcoloR)
library(dplyr)
library(ggforce) # for 'geom_arc_bar'
library(scales)

files <- list.files(path=".", pattern="merged_summ_.*.txt", full.names=F, recursive=FALSE)

#read tables; zero counts become NA
for (i in files){
  table <- paste("t", i, sep = ".")
  assign(table, value = read.table(i, sep = " ", header = F, na.strings = "0"))
}

objs<-as.list(mget(ls(pattern = ".*.txt")))

#remove NAs
for (i in 1:length(objs)){
  prefix<- paste("t", names(objs)[[i]], sep = ".")
  assign(prefix, objs[[i]][complete.cases(objs[[i]]),])
}

objs2<-as.list(mget(ls(pattern = "t.t.")))

#Create plot and save pdf
for (i in 1:length(objs2)){
prefix<-paste("df", i, sep = ".")
assign(prefix, objs2[[i]])
}

objs3<-as.list(mget(ls(pattern = "df.")))

for (i in 1:length(objs3)){
#add headers
colnames(objs3[[i]])<-c("item","count")
#capitalize species names
objs3[[i]][[1]]<-paste(toupper(substr(objs3[[i]][[1]], 1, 1)), substr(objs3[[i]][[1]], 2, nchar(as.character(objs3[[i]][[1]]))), sep="")
#change underscores to spaces
objs3[[i]][[1]]<-gsub(pattern = "_", (objs3[[i]][[1]]), replacement = " ")

objs3[[i]]<-objs3[[i]][order(objs3[[i]]$count),]
objs3[[i]]$Label <- paste0(paste0(round(((objs3[[i]]$count/sum(objs3[[i]]$count))*100),2),"%"))


objs3[[i]] <- objs3[[i]] %>% 
  mutate(end = 2 * pi * cumsum(count)/sum(count),
         start = lag(end, default = 0),
         middle = 0.5 * (start + end),
         hjust = ifelse(middle > pi, 1, 0),
         vjust = ifelse(middle < pi/2 | middle > 3 * pi/2, 0, 1))

##------------------------------------##
#emulate default colors to use in labels
ggplotColours <- function(n = 6, h = c(0, 360) + 15){
  if ((diff(h) %% 360) < 1) h[2] <- h[2] - 360/n
  hcl(h = (seq(h[1], h[2], length = n)), c = 100, l = 65)
}

n <- nrow(objs3[[i]])
pallete = ggplotColours(n)

##------------------------------------##
pdf(file = "pieplot.pdf", width = 10, height = 7)
#plot<-paste("p", i, sep = ".")

plot<-ggplot(objs3[[i]]) + 
  geom_arc_bar(aes(x0 = 0, y0 = 0, r0 = 0, r = 1,
                   start = start+1, end = end+1, fill = reorder(item, -count))) +
  geom_label_repel(aes(x = sin(middle+1), y = cos(middle+1), label = Label, hjust = NULL, vjust = vjust/10), nudge_x= 0.5 * cos(objs3[[i]]$middle), nudge_y = 0.1 * cos(objs3[[i]]$middle), cex = 7, fill = rev(pallete), fontface = "bold") + 
  coord_fixed() +
  scale_x_continuous(limits = c(-1, 1.4),  # Adjust so labels are not cut off
                     name = "", breaks = NULL, labels = NULL) +
  scale_y_continuous(limits = c(-1.01, 1.01),      # Adjust so labels are not cut off
                     name = "", breaks = NULL, labels = NULL) +
  labs(fill="Species") + 
  ggtitle("Annotation species distribution") + 
  theme(legend.title = element_text(face="bold", size = 15), legend.text = element_text(face="bold.italic", size = 12), plot.title = element_text(size = 20, face = "bold"))
print(plot)
}
dev.off()

#remove all previous objects
rm(list=ls())

#clear console
cat("\f")
