complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  complete_data<- data.frame()
  data<- data.frame()
  complete <- matrix(ncol = 2, nrow= length(id))
  colnames(complete) <- c("id", "nobs")
  
  DATAFILE<-list.files(path = directory, full.names = TRUE)
  
  for(i in seq_along(id)){
    data<-read.csv(DATAFILE[id[i]])
    # complete_data<-subset(data,!(is.na(data$sulfate) | is.na(data$nitrate)))
    complete_data<- subset(data, complete.cases(data))
    # print(complete_data)
     complete[i, 1] <-id[i]
    complete[i,2] <- length(which(complete_data[,4] == id[i]))
    
  }
  
  data.frame(complete)
  
}  