library(dplyr)

accident <- read.csv('accident/ACCIDENT.csv')

unique(accident$SPEED_ZONE)

acc_not_in <- accident[which(accident$SPEED_ZONE >= 70 & !accident$SPEED_ZONE %in% c(777, 888, 999)), ]


asd <-as.data.frame(table(acc_not_in$Accident.Type.Desc))
asd['percentage'] <- asd$Freq/sum(asd$Freq)


####
these_accidents <- asd[which(asd$percentage > 0.05), ][,'Var1']
acc_not_in_speed <- acc_not_in[which(acc_not_in$Accident.Type.Desc %in% these_accidents), ]

####
speed_less_60 <- accident[which(accident$SPEED_ZONE < 60), ]
speed_less_60 <- as.data.frame(table(speed_less_60$Accident.Type.Desc))

speed_60_70 <- accident[which(accident$SPEED_ZONE %in% c(60, 70)), ]
speed_60_70 <- as.data.frame(table(speed_60_70$Accident.Type.Desc))

speed_80_100 <- accident[which(accident$SPEED_ZONE >= 80 & accident$SPEED_ZONE < 100), ]
speed_80_100 <- as.data.frame(table(speed_80_100$Accident.Type.Desc))

speed_greater_100 <- accident[which(accident$SPEED_ZONE >= 100 & accident$SPEED_ZONE < 500), ]
speed_greater_100 <- as.data.frame(table(speed_greater_100$Accident.Type.Desc))

as.data.frame(table(speed_80_100$Accident.Type.Desc))

speed_less_60['percentage'] <- speed_less_60$Freq/sum(speed_less_60$Freq)
speed_60_70['percentage'] <- speed_60_70$Freq/sum(speed_60_70$Freq)
speed_80_100['percentage'] <- speed_80_100$Freq/sum(speed_80_100$Freq)
speed_greater_100['percentage'] <- speed_greater_100$Freq/sum(speed_greater_100$Freq)

speed_less_60[c(1,3),]
speed_60_70[c(1,3),]
speed_80_100
speed_greater_100

head(accident$ACCIDENTDATE, 1)
tail(accident$ACCIDENTDATE, 1)

unique(accident$SPEED_ZONE)


as <- as.data.frame(table(accident$Accident.Type.Desc))

View(accident)
barplot(as)

