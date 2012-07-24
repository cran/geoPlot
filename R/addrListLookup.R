addrListLookup <-
function(x){
  y <- data.frame(t(rep(NA,8)))
  colnames(y) <- c("id","address","latitude","longitude","box_north","box_south","box_east","box_west")
  y <- y[-1,]
  for (i in 1:nrow(x)) {
    input <- x[i,]
    y <- rbind(y,geoAddress(input))}
  return(y)}
