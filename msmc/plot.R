mu <- 1.25e-8
gen <- 30
fm020Dat<-read.table("~/research_icloud/msmc/FM020.msmc2.final.txt", header=TRUE)
t5Dat<-read.table("~/research_icloud/msmc/T5.msmc2.final.txt", header=TRUE)
Dat<-read.table("~/research_icloud/msmc/I4.msmc2.final.txt", header=TRUE)
plot(t5Dat$left_time_boundary/mu*gen, (1/t5Dat$lambda)/(2*mu), log="x",ylim=c(0,100000),
     type="n", xlab="Years ago", ylab="effective population size")
lines(fm020Dat$left_time_boundary/mu*gen, (1/fm020Dat$lambda)/(2*mu), type="s", col="red")
lines(t5Dat$left_time_boundary/mu*gen, (1/t5Dat$lambda)/(2*mu), type="s", col="blue")
lines(Dat$left_time_boundary/mu*gen, (1/Dat$lambda)/(2*mu), type="s", col="black")
legend("topright",legend=c("FM020", "T5", "I4"), col=c("red", "blue", "black"), lty=c(1,1))