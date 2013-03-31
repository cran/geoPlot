addrListLookup <-
function(x){
    y <- data.frame(t(rep(NA,4)))
    colnames(y) <- c("id","address","latitude","longitude")
    y <- y[-1,]
    for (i in 1:nrow(x)) {
      input <- x[i,]
      x[1,]#
      geoAddress(x[1,])#
      y <- rbind(y,geoAddress(input))}
    return(y)}
