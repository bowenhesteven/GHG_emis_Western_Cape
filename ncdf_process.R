library(ncdf4)
library(stars)
library(PCICt)
library(dplyr)
library(raster)
library(readxl)
library(rgdal)
library(ggplot2)
library(reshape2)
library(scales)
library(rgeos)
library(maptools)
# my_spdf <- readOGR( 
#   dsn= paste0(getwd(),"/SA_shapefile/") , 
#   # layer="TM_WORLD_BORDERS_SIMPL-0.3",
#   verbose=FALSE
# )
# plot(my_spdfcol="#f2f2f2", bg="skyblue", lwd=0.25, border=0 ))
# library(ncmeta)
setwd("~/Desktop/NCDF_process_code_data") ## before saving files use this lin
file_test = read_ncdf("pr_mon_AFR-44_MIROC-MIROC5_rcp85_r1i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc", var = c("pr"))
file = brick("pr_mon_AFR-44_MIROC-MIROC5_rcp85_r1i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc", var = c("pr"))
plot(file)
ts = extract(file, c(18, -35))
ts = as.data.frame(t(ts))
ts$V1 = ts$V1*60*60*24*30 ##this is to convert the unit from kg/m^2/s to mm/month using average 30 days of a month

plot(ts$V1,x = 1:1140, xlim = c(1,100))
lines(y = ts$V1, x = 1:1140, xlim = c(1,100) )
coordinates = read_excel("coordinates.xlsx")
coordinates$Latitude =  as.numeric(sp::char2dms(coordinates$Latitude))
coordinates$Longitude = as.numeric(sp::char2dms(coordinates$Longitude))
winelands = c("Breed Valley", "Langberg", "Witzenberg", "Swartland", "Drakenstein" , "Cape Town", "Stellenbosch") ## add drakenstein stellenbosch swartland to big six calc
reservoirs = c("Theewaterskloof", "Voelvlei", "Berg River", "Wemmershoek", "Steenbras Lower") 
big_six_catchment = c("VREDENDAL","REDELINGSHUYS","Porterville","LANGGEWENS","CERES AWS", "TYGERHOEK",  "OVERBERG")
avg_stations = c("Drakenstein" , "Cape Town","Theewaterskloof", "Voelvlei", "Berg River", "Steenbras Lower","VREDENDAL","REDELINGSHUYS","Porterville","LANGGEWENS","CERES AWS", "TYGERHOEK",  "OVERBERG" )
others = setdiff(coordinates$StationName, c(winelands,reservoirs))
coord_wine = coordinates %>% filter(StationName %in% winelands)
coord_rsvr = coordinates %>% filter(StationName %in% reservoirs)
coord_bigsix = coordinates %>% filter(StationName %in% big_six_catchment)
coord_pet_avg = coordinates %>% filter(StationName %in% avg_stations)
pr_filenames = data.frame("model_name" = list.files()[3:20])
tmax_filenames = data.frame("model_name" = list.files()[22:39])
tmin_filenames = data.frame("model_name" = list.files()[40:56])

ts = extract(file, c(18, -35))
pr_CCLM = pr_filenames[grep("CCLM",pr_filenames$model_name),]
pr_RCA = pr_filenames[grep("RCA",pr_filenames$model_name),]
pr_RACMO = pr_filenames[grep("RACMO",pr_filenames$model_name),]
pr_REMO = pr_filenames[grep("REMO",pr_filenames$model_name),]
pr_HIRHAM = pr_filenames[grep("HIRHAM",pr_filenames$model_name),]
### there is no files of rcms of WRF and ALADIN
# pr_WRF = pr_filenames[grep("WRF",pr_filenames$model_name),]
# pr_ALADIN = pr_filenames[grep("ALADIN",pr_filenames$model_name),] 
identical((length(pr_CCLM)+length(pr_RCA) + length(pr_RACMO) + length(pr_HIRHAM) + length(pr_REMO)), nrow(pr_filenames))

tmax_CCLM = tmax_filenames[grep("CCLM",tmax_filenames$model_name),] 
tmax_RCA = tmax_filenames[grep("RCA",tmax_filenames$model_name),]
tmax_RACMO = tmax_filenames[grep("RACMO",tmax_filenames$model_name),]
tmax_REMO = tmax_filenames[grep("REMO",tmax_filenames$model_name),]
tmax_HIRHAM = tmax_filenames[grep("HIRHAM",tmax_filenames$model_name),]
# tmax_WRF = tmax_filenames[grep("WRF",tmax_filenames$model_name),]
# tmax_ALADIN = tmax_filenames[grep("ALADIN",tmax_filenames$model_name),] 
identical((length(tmax_CCLM)+length(tmax_RCA) + length(tmax_RACMO) + length(tmax_HIRHAM) + length(tmax_REMO)), nrow(tmax_filenames))

tmin_CCLM = tmin_filenames[grep("CCLM",tmin_filenames$model_name),]
tmin_RCA = tmin_filenames[grep("RCA",tmin_filenames$model_name),] 
tmin_RACMO = tmin_filenames[grep("RACMO",tmin_filenames$model_name),]
tmin_REMO = tmin_filenames[grep("REMO",tmin_filenames$model_name),]
tmin_HIRHAM = tmin_filenames[grep("HIRHAM",tmin_filenames$model_name),]
# tmin_WRF = tmin_filenames[grep("WRF",tmin_filenames$model_name),]
# tmin_ALADIN = tmin_filenames[grep("ALADIN",tmin_filenames$model_name),] 
identical((length(tmin_CCLM)+length(tmin_RCA) + length(tmin_RACMO) + length(tmin_HIRHAM) + length(tmin_REMO)), nrow(tmin_filenames))

### 3 CCLM models are identical for Tmin, Tmax, and pr
### out of 9 RCA models, tmin is missing the MICROC5 GCM simulations, therefore remove the MICROC5 from Tmax and pr
### only 1 RACMO model, tmin, max, and pr are the same
### 4 REMO models, tmin, max, and pr are the same
### only 1 HIRHAM model, tmin, max, and r are the same
tmax_filenames = tmax_filenames[-which(tmax_filenames$model_name == "tasmax_mon_AFR-44_MIROC-MIROC5_rcp85_r1i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc"),]
pr_filenames = pr_filenames[-which(pr_filenames$model_name == "pr_mon_AFR-44_MIROC-MIROC5_rcp85_r1i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc"),]
tmin_filenames =tmin_filenames$model_name
filenames = data.frame(tmax_filenames,tmin_filenames,pr_filenames)

# Worcester
# Robertson
# Porterville
# Malsberry
# Paarl
# CT_AWS
# JONkershoek

# data.frame()
# for (j in 1: ncol(pr_filenames)){### loop through each 
## max temp for stations 
selection = c("_AFR-44_CCCma-CanESM2_rcp85_r1i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc",
              "_AFR-44_ICHEC-EC-EARTH_rcp85_r12i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc",
              "_AFR-44_CNRM-CERFACS-CNRM-CM5_rcp85_r1i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc",
              "_AFR-44_NOAA-GFDL-GFDL-ESM2M_rcp85_r1i1p1_SMHI-RCA4_v1_mon_200601-210012_wcape.nc")
#############################################################################################
### this is for reservoir stations
tmax_rsvr = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))
rownames(tmax_rsvr) = month$month
# for (i in 1:5){
#   assign(paste0("tmax_rsvr", i),data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))) 
# }

for (j in 1:nrow(coord_rsvr)){ ## 5 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 5
    fname = as.character(paste("tasmax_mon", selection[i],sep = ""))
    print(fname)
    file = brick(fname, var = c("tasmax"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_rsvr$Longitude[j])
    n2 = as.numeric(coord_rsvr$Latitude[j])
    # print(n1)
    # print(n2)
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    tmax_rsvr[,i] = ts$V1
    print(i)
  }
  assign(paste0("tmax_rsvr",j), tmax_rsvr)
  print(j)
  print(n1)
  print(n2)
}
# 
# plot(tmax_rsvr1$model2)
# plot(tmax_rsvr2$model2)
# plot(tmax_rsvr3$model2)
# plot(tmax_rsvr4$model2)
# plot(tmax_rsvr5$model2)

tmin_rsvr = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))
rownames(tmin_rsvr) = month$month

for (j in 1:nrow(coord_rsvr)){ ## 5 stations
  for (i in 1: length(selection)){## 4 models
      # i =1
    # j = 1
    fname = as.character(paste("tasmin_mon", selection[i],sep = ""))
    file = brick(fname, var = c("tasmin"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_rsvr$Longitude[j])
    n2 = as.numeric(coord_rsvr$Latitude[j])
    # print(n1)
    # print(n2)
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    tmin_rsvr[,i] = ts$V1
    print(i)
  }
  assign(paste0("tmin_rsvr",j), tmin_rsvr)
  print(j)
  print(n1)
  print(n2)
}

# plot(tmin_rsvr1$model2)
# plot(tmin_rsvr2$model2)
# plot(tmin_rsvr3$model2)
# plot(tmin_rsvr4$model2)
# plot(tmin_rsvr5$model2)

pr_rsvr = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))
rownames(pr_rsvr) = month$month

for (j in 1:nrow(coord_rsvr)){ ## 5 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 1
    fname = as.character(paste("pr_mon", selection[i],sep = ""))
    file = brick(fname, var = c("pr"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_rsvr$Longitude[j])
    n2 = as.numeric(coord_rsvr$Latitude[j])
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    pr_rsvr[,i] = ts$V1 * 60 * 60 * 24 * 30
  }
  assign(paste0("pr_rsvr",j), pr_rsvr)
  
}
month = data.frame("month" = seq(as.Date("2006/1/31"), as.Date("2100/12/31"), "month")) 
ggplot(pr_rsvr1, aes(x=month, y=model1)) +
  geom_line() + 
  xlab("")

# plot(pr_rsvr1$model2, pr_rsvr1$month)
# plot(pr_rsvr2$model2)
# plot(pr_rsvr3$model2)
# plot(pr_rsvr4$model2)
# plot(pr_rsvr5$model2)
for (i in 1:nrow(coord_rsvr)){
  assign(paste0("tavg_rsvr",i), (get(paste0("tmin_rsvr", i)) + get(paste0("tmax_rsvr", i)) )/ 2 - 273)
}
tavg_rsvr1 = cbind.data.frame(month,tavg_rsvr1)
tavg_p = melt(tavg_rsvr1, id = "month")
ggplot(tavg_p,aes(x= month, y = value, colour = variable, group = variable)) + geom_line()+ylab("Celsius") + xlim(as.Date(c('01/01/2006','31/12/2100'), format="%d/%m/%Y") )
tavg_rsvrs_m1 = cbind.data.frame(month,tavg_rsvr1$model1, tavg_rsvr2$model1, tavg_rsvr3$model1, tavg_rsvr4$model1, tavg_rsvr5$model1) 
colnames(tavg_rsvrs_m1) = c("month","rsvr1","rsvr2","rsvr3","rsvr4","rsvr5")
tavg_rsvrs_p = melt(tavg_rsvrs_m1, id = "month")
ggplot(tavg_rsvrs_p,aes(x= month, y = value, colour = variable, group = variable)) + geom_line()+ylab("Celsius") + xlim(as.Date(c('01/01/2006','31/12/2100'), format="%d/%m/%Y") )

pr_rsvr1 = cbind.data.frame(month,pr_rsvr1)
pr_p = melt(pr_rsvr1, id = "month")
ggplot(pr_p,aes(x= month, y = value, colour = variable, group = variable)) + geom_line()+ylab("mm/month") + xlim(as.Date(c('01/01/2006','31/12/2100'), format="%d/%m/%Y") )
pr_rsvrs_m1 = cbind.data.frame(month,pr_rsvr1$model1, pr_rsvr2$model1, pr_rsvr3$model1, pr_rsvr4$model1, pr_rsvr5$model1) 
colnames(pr_rsvrs_m1) = c("month","rsvr1","rsvr2","rsvr3","rsvr4","rsvr5")
pr_rsvrs_p = melt(pr_rsvrs_m1, id = "month")
ggplot(pr_rsvrs_p,aes(x= month, y = value, colour = variable, group = variable)) + geom_line()+ylab("mm/month") + xlim(as.Date(c('01/01/2006','31/12/2100'), format="%d/%m/%Y") )

#############################################################################################
######### this is for wine lands
tmax_wine = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))
rownames(tmax_wine) = month$month
# for (i in 1:5){
#   assign(paste0("tmax_wine", i),data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))) 
# }

for (j in 1:nrow(coord_wine)){ ## 7 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 5
    fname = as.character(paste("tasmax_mon", selection[i],sep = ""))
    print(fname)
    file = brick(fname, var = c("tasmax"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_wine$Longitude[j])
    n2 = as.numeric(coord_wine$Latitude[j])
    # print(n1)
    # print(n2)
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    tmax_wine[,i] = ts$V1
    print(i)
  }
  assign(paste0("tmax_wine",j), tmax_wine)
  print(j)
  print(n1)
  print(n2)
}

# plot(tmax_wine1$model2)
# plot(tmax_wine2$model2)
# plot(tmax_wine3$model2)
# plot(tmax_wine4$model2)
# plot(tmax_wine5$model2)

tmin_wine = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))
rownames(tmin_wine) = month$month

for (j in 1:nrow(coord_wine)){ ## 5 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 1
    fname = as.character(paste("tasmin_mon", selection[i],sep = ""))
    file = brick(fname, var = c("tasmin"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_wine$Longitude[j])
    n2 = as.numeric(coord_wine$Latitude[j])
    # print(n1)
    # print(n2)
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    tmin_wine[,i] = ts$V1
    print(i)
  }
  assign(paste0("tmin_wine",j), tmin_wine)
  print(j)
  print(n1)
  print(n2)
}



# plot(tmin_wine1$model2)
# plot(tmin_wine2$model2)
# plot(tmin_wine3$model2)
# plot(tmin_wine4$model2)
# plot(tmin_wine5$model2)

pr_wine = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))

for (j in 1:nrow(coord_wine)){ ## 5 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 1
    fname = as.character(paste("pr_mon", selection[i],sep = ""))
    file = brick(fname, var = c("pr"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_wine$Longitude[j])
    n2 = as.numeric(coord_wine$Latitude[j])
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    pr_wine[,i] = ts$V1 * 60 * 60 * 24 * 30
  }
  assign(paste0("pr_wine",j), pr_wine)
  
}

for (i in 1:nrow(coord_wine)){
  assign(paste0("tavg_wine",i), (get(paste0("tmin_wine", i)) + get(paste0("tmax_wine", i)) )/ 2 - 273)
}
### Now extracted dam data, need to extract wine irrigation data 
##
pr_p = melt(pr_wine1, id = "month")
ggplot(pr_p,aes(x= month, y = value, colour = variable, group = variable)) + geom_line() + xlim(as.Date(c('01/01/2009','31/12/2100'), format="%d/%m/%Y") )

#############################################################################################
######### this is for big_six
tmax_bigsix = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))
rownames(tmax_bigsix) = month$month
# for (i in 1:5){
#   assign(paste0("tmax_bigsix", i),data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))) 
# }

for (j in 1:nrow(coord_bigsix)){ ## 7 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 5
    fname = as.character(paste("tasmax_mon", selection[i],sep = ""))
    print(fname)
    file = brick(fname, var = c("tasmax"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_bigsix$Longitude[j])
    n2 = as.numeric(coord_bigsix$Latitude[j])
    # print(n1)
    # print(n2)
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    tmax_bigsix[,i] = ts$V1
    print(i)
  }
  assign(paste0("tmax_bigsix",j), tmax_bigsix)
  print(j)
  print(n1)
  print(n2)
}

# plot(tmax_bigsix1$model2)
# plot(tmax_bigsix2$model2)
# plot(tmax_bigsix3$model2)
# plot(tmax_bigsix4$model2)
# plot(tmax_bigsix5$model2)

tmin_bigsix = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))
rownames(tmin_bigsix) = month$month

for (j in 1:nrow(coord_bigsix)){ ## 5 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 1
    fname = as.character(paste("tasmin_mon", selection[i],sep = ""))
    file = brick(fname, var = c("tasmin"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_bigsix$Longitude[j])
    n2 = as.numeric(coord_bigsix$Latitude[j])
    # print(n1)
    # print(n2)
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    tmin_bigsix[,i] = ts$V1
    print(i)
  }
  assign(paste0("tmin_bigsix",j), tmin_bigsix)
  print(j)
  print(n1)
  print(n2)
}



# plot(tmin_bigsix1$model2)
# plot(tmin_bigsix2$model2)
# plot(tmin_bigsix3$model2)
# plot(tmin_bigsix4$model2)
# plot(tmin_bigsix5$model2)

pr_bigsix = data.frame(model1 = rep(0,1140), model2 = rep(0,1140), model3 = rep(0,1140), model4 = rep(0,1140))

for (j in 1:nrow(coord_bigsix)){ ## 5 stations
  for (i in 1: length(selection)){## 4 models
    # i =1
    # j = 1
    fname = as.character(paste("pr_mon", selection[i],sep = ""))
    file = brick(fname, var = c("pr"))
    crs(file) <- CRS("+init=epsg:22293")
    n1 = as.numeric(coord_bigsix$Longitude[j])
    n2 = as.numeric(coord_bigsix$Latitude[j])
    ts = extract(file, cbind(n1, n2))
    ts = as.data.frame(t(ts)) ### tofinish the loop of processing one station of temp for numbers of models now choose 4 of the rca4 cover range of global warming levels)
    pr_bigsix[,i] = ts$V1 * 60 * 60 * 24 * 30
  }
  assign(paste0("pr_bigsix",j), pr_bigsix)
  
}

for (i in 1:nrow(coord_bigsix)){
  assign(paste0("tavg_bigsix",i), (get(paste0("tmin_bigsix", i)) + get(paste0("tmax_bigsix", i)) )/ 2 - 273)
}
### Now extracted dam data, need to extract wine irrigation data 
##
pr_p = melt(pr_bigsix1, id = "month")
ggplot(pr_p,aes(x= month, y = value, colour = variable, group = variable)) + geom_line() +ylab("mm/month") + xlim(as.Date(c('01/01/2009','31/12/2100'), format="%d/%m/%Y") )


##################################################################
setwd("~/Library/Mobile Documents/com~apple~CloudDocs/CapeTownABM/DATA/Future Climate Data/rcp85/WesternCape_rainfall_temp") # for saving files into the sub-folder
## start with reservoirs
station_data = coord_rsvr
# station_data = coord_wine
# station_data = coord_bigsix
station_data$StationName =  gsub(" ", "_", station_data$StationName)
# rainfilenames = c()
# tempfilenames = c()
savefile_names = c()
saveAWC_names = c()
for (j in 1:4){
  for (i in 1: nrow(station_data))
  {
  # rainfilenames = c(rainfilenames, paste(station_data[i,"Station.Name"], "_rainfall.csv", sep = "")) 
  # tempfilenames = c(tempfilenames, paste(station_data[i,"Station.Name"], "_temperature.csv", sep = ""))
  savefile_names = c(savefile_names, paste("Model", j, "_", station_data[i,"StationName"], "_R_T.txt", sep = ""))
  saveAWC_names = c(saveAWC_names, paste("Model",j, "_", station_data[i,"StationName"], "_AWC.txt", sep = ""))
  }
}
real_length_months = 2 + 12* (2100 - 2006 + 1)
month_rain_his = rep(0,real_length_months)
month_temp_his = rep(0,real_length_months)

###loop for process all the resevoirs
for (k in 1:4){## i for 4 models
  print(k)
  for (j in 1: nrow(station_data)) 
  { ## j for different stations
    # rainfallfile_name = rainfilenames[j]
    # tempfile_name = tempfilenames[j]
    # j = 1
    # i = 4
    i = k
    x_cord = station_data[j,"X"]
    y_cord = station_data[j,"Y"]
    # name pf Matlab file of temperature and rain history including fabracated rainfall and temp from 1930 to 2008
    savefile_name = savefile_names[j + nrow(station_data) * (i - 1)]
    #file name of the available water content information
    saveAWC_name = saveAWC_names[j + nrow(station_data) * (i - 1)]
 
    # Available Water Content in inches
    AWC_num = station_data[j,"AWC(inch)"]
    # Starting year of the fabrication of the historic data in matlab
    fabr_start_year = 1930
    # End year of the fabrication of the historic data in matlab
    fabr_end_year = 2005
    # The start year of the real data series
    series_start_year = 2006
    # The end year of the real data series
    series_end_year = 2100
    # length of the data
    month_length = (series_end_year - fabr_start_year + 1) * 12
    
    # 
    monthly_rainfall = get(paste0("pr_rsvr",j))[i] / 25.4 # convert from mm/month to inch per month
    monthly_temp     = get(paste0("tavg_rsvr",j))[i] * 9/5 + 32 # convert from celsius to farenheit

    # monthly_rainfall = get(paste0("pr_wine",j))[i] / 25.4 # convert from mm/month to inch per month 
    # monthly_temp     = get(paste0("tavg_wine",j))[i] * 9/5 + 32 # convert from celsius to farenheit

    # monthly_rainfall = get(paste0("pr_bigsix",j))[i] / 25.4 # convert from mm/month to inch per month 
    # monthly_temp     = get(paste0("tavg_bigsix",j))[i] * 9/5 + 32 # convert from celsius to farenheit
    # 
    monthly_rainfall = unlist(monthly_rainfall)
    monthly_temp     = unlist(monthly_temp)
    # print(c(length(monthly_rainfall),length(monthly_temp)))
    #create the list for months
    
    month = c(1:12)
    month_matlab = c()
    
    # year 1 is for matlab file
    year1 = c() 
    for (i in fabr_start_year:series_end_year) 
    {
      month_matlab = c(month_matlab, month)
      year1 = c(year1, rep(i,12))
    }
    
    
    
    temp_fabr = c()
    rain_fabr = c()
    for (i in fabr_start_year:fabr_end_year)
    {
      temp_fabr = c(temp_fabr, rnorm(12,55,4))
      rain_fabr = c(rain_fabr, rnorm(12,1,0.4)) 
      
    }
    
    monthly_rainfall_matlab = c(rain_fabr,monthly_rainfall)
    monthly_temp_matlab = c(temp_fabr,monthly_temp)
    
    
    
    #Start with molteno reservoir 33.39 degree S latitude 
    LAT = rep(station_data$Latitude[j], month_length)
    txt<-cbind.data.frame(LAT,year1,monthly_temp_matlab, monthly_rainfall_matlab)
    
    write.table(txt, file = savefile_name, append = FALSE, sep = "\t",
                row.names = FALSE, col.names = FALSE)
    write.table(AWC_num, file = saveAWC_name, append = FALSE, sep = "\t",
                row.names = FALSE, col.names = FALSE)
    
    # month_rain_his = cbind.data.frame(month_rain_his,c(as.integer(x_cord),as.integer(y_cord),monthly_rainfall))
    # month_temp_his = cbind.data.frame(month_temp_his,c(as.integer(x_cord),as.integer(y_cord),monthly_temp))
    print(j)
    print(station_data$StationName[j])
  }
  print(paste0("Model",k))
}



