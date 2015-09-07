corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  comp_case<- complete(directory,1:332)
  #print(comp_case)
  comp_threshold<- subset(comp_case,comp_case$nobs > threshold)
  #print(comp_threshold)
  cr<- numeric()
  DATAFILE<-list.files(path = directory, full.names = TRUE)
  
  for(i in seq_along(comp_threshold$id)){
    data<-read.csv(DATAFILE[comp_threshold$id[i]])
    complete_threshold_data<- subset(data, complete.cases(data))
    cr[i]<- cor(complete_threshold_data$sulfate, complete_threshold_data$nitrate)
    }
print(cr)
}