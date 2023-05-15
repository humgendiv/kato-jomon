mu <- 1.25e-8
gen <- 30
afrDat<-read.table("/home/mkato952/data/msmc/effective_population_size/FM020.msmc2.final.txt", header=TRUE)
eurDat<-read.table("/home/mkato952/data/msmc/effective_population_size/T5.msmc2.final.txt", header=TRUE)
plot(afrDat$left_time_boundary/mu*gen, (1/afrDat$lambda)/(2*mu), log="x",ylim=c(0,100000),
     type="n", xlab="Years ago", ylab="effective population size")
lines(afrDat$left_time_boundary/mu*gen, (1/afrDat$lambda)/(2*mu), type="s", col="red")
lines(eurDat$left_time_boundary/mu*gen, (1/eurDat$lambda)/(2*mu), type="s", col="blue")
legend("topright",legend=c("FM020", "T5"), col=c("red", "blue"), lty=c(1,1))