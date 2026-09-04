
mydata <- read.table('ry.snp.txt', stringsAsFactors = F, header = T)
mydata2 <- mydata[, c(1:2)]

mydata[,3] <- paste(mydata[,1], mydata[,2], sep = '_')
colnames(mydata) <- c('Chromosome', 'Position', 'SNP')
mydata <- mydata[c(3,1,2)]


library(CMplot)
CMplot(mydata,plot.type="d",bin.size=1e3,chr.den.col=c("blue", "yellow", "red"),file="pdf",file.name='The number of SNPs within 0.001 Mbwindows size',dpi=300,
       main="The number of SNPs within 0.001Mbwindows size",file.output=TRUE,verbose=TRUE,width=9,height=6)
