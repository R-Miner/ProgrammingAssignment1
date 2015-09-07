pollutantmean <- function(directory, pollutant, id=1:332)
{
DATAFILE<-list.files(path = directory, full.names = TRUE)

data <- data.frame()
#mean_data<- numeric()
for(i in id)
  {
  data <- rbind(data, read.csv(DATAFILE[i]))
}
if(pollutant == 'sulfate'){
  m<-mean(data[ , 2], na.rm =TRUE)
}
if(pollutant == 'nitrate'){
  m<-mean(data[ , 3], na.rm =TRUE)
}
return(m)
}