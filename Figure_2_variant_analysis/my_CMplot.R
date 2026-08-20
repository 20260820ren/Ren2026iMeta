mydata <- read.table('ry.snp.txt', stringsAsFactors = F, header = T)
mydata[,3] <- paste(mydata[,1], mydata[,2], sep = '_')
colnames(mydata) <- c('Chromosome', 'Position', 'SNP')
mydata <- mydata[c(3,1,2)]


library(CMplot)
CMplot(mydata,plot.type="d",bin.size=1e6,chr.den.col=c("darkgreen", "yellow", "red"),file="jpg",file.name=NULL,dpi=300,
       main="",file.output=TRUE,verbose=TRUE,width=9,height=6)
