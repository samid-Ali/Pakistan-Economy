lapply(c("ggplot2", "dplyr", "stringr", "purrr", "magick"),require, character.only = TRUE)

setwd("G:/Samid work/Pakistan/Plots5")
getwd()

# want to use code for column name rather than the overly descriptive name
header <- scan("G:/Samid work/Pakistan/WorldBank_PakistanAll_Updated2.csv", nlines = 1, what = character(),sep = ",")
data <- read.csv("G:/Samid work/Pakistan/WorldBank_PakistanAll_Updated2.csv", skip = 2, header = FALSE)
names(data) <- header
str(data)

a <-(colnames(data)[-1])
Names <- as.list(strsplit(a, ","))

# plot each variable for visualisation
#note geom_smooth has been commented out however can include 
for (name in Names){
  i <- which(Names==name)
  print(paste(i,name, sep=" "))
  x=data$Year
  y =as.numeric(data[,i])
  ggplot(data = data, aes(x, y), colour="#000099") + 
    geom_point(size=2)+
  #geom_smooth(method=lm, se=FALSE)+
    labs(title =i, y=colnames(data[i]), x="Year")+
    theme_minimal() 
      filename= paste(gsub(" ","",gsub(":","",gsub(">","",gsub("/","",gsub("%","", name))))),".png", sep="")
      ggsave(filename)
}

#combine all plots in pdf
all_images <- list.files( pattern = '.png')
all_images
all_images_1 <- purrr::reduce(
  purrr::map(all_images,image_read),
  c
)
all_images_1
image_write(all_images_1 , format = "pdf", "Plots.pdf")

#Append images to word document
cat("<body>", file = "Plot_Test.doc", sep="\n")
for (i in list.files( pattern = '.png')){
temp <- paste("<img src=", i,">")
cat(temp, file="Plot_Test.doc", sep="\n", append=TRUE)
}
cat("<body>", file = "Plot_Test.doc", sep="\n", append=TRUE)



