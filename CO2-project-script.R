library(ncdf4)
library(raster)
library(rgdal)
library(ggplot2)
library(abind)

# setup working directory
setwd("~/Desktop/CO2-project/Project/data")


### -----------------------------------------Precipitation----------------------------------------------###
##-------------------------rcp2.6 scenario--------------------------------------------------------
#-------------------200601-201012-----------------
setwd("~/Desktop/CO2-project/Project/data/pr-precipitation/rcp26")
pr_rcp26_1 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_200601-201012.nc")
lon <- ncvar_get(pr_rcp26_1, "lon")
lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_1.array <- ncvar_get(pr_rcp26_1, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_1<-apply(pr_rcp26_1.array, c(1,2), mean)
avg_pr_rcp26_1_raster <- raster(t(avg_pr_rcp26_1), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_1_raster <- flip(avg_pr_rcp26_1_raster, direction = 'y')
plot(avg_pr_rcp26_1_raster, main = "Mean Precipitation during 2006/01-2010/12")
writeRaster(avg_pr_rcp26_1_raster, filename = "avg_pr_rcp26_1.nc", format = "CDF", overwrite = TRUE)
#---------------------201101-202012------------------------------
pr_rcp26_2 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_201101-202012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_2.array <- ncvar_get(pr_rcp26_2, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_2<-apply(pr_rcp26_2.array, c(1,2), mean)
avg_pr_rcp26_2_raster <- raster(t(avg_pr_rcp26_2), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_2_raster <- flip(avg_pr_rcp26_2_raster, direction = 'y')
plot(avg_pr_rcp26_2_raster, main = "Mean Precipitation during 2011/01-2020/12")
writeRaster(avg_pr_rcp26_2_raster, filename = "avg_pr_rcp26_2.nc", format = "CDF", overwrite = TRUE)
#-----------------------202101-203012------------------------------
pr_rcp26_3 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_3.array <- ncvar_get(pr_rcp26_3, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_3<-apply(pr_rcp26_3.array, c(1,2), mean)
avg_pr_rcp26_3_raster <- raster(t(avg_pr_rcp26_3), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_3_raster <- flip(avg_pr_rcp26_3_raster, direction = 'y')
plot(avg_pr_rcp26_3_raster, main = "Mean Precipitation during 2021/01-2030/12")
writeRaster(avg_pr_rcp26_3_raster, filename = "avg_pr_rcp26_3.nc", format = "CDF", overwrite = TRUE)
#-----------------------203101-204012------------------------------
pr_rcp26_4 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_4.array <- ncvar_get(pr_rcp26_4, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_4<-apply(pr_rcp26_4.array, c(1,2), mean)
avg_pr_rcp26_4_raster <- raster(t(avg_pr_rcp26_4), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_4_raster <- flip(avg_pr_rcp26_4_raster, direction = 'y')
plot(avg_pr_rcp26_4_raster, main = "Mean Precipitation during 2031/01-2040/12")
writeRaster(avg_pr_rcp26_4_raster, filename = "avg_pr_rcp26_4.nc", format = "CDF", overwrite = TRUE)
#-----------------------204101-205012------------------------------
pr_rcp26_5 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_5.array <- ncvar_get(pr_rcp26_5, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_5<-apply(pr_rcp26_5.array, c(1,2), mean)
avg_pr_rcp26_5_raster <- raster(t(avg_pr_rcp26_5), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_5_raster <- flip(avg_pr_rcp26_5_raster, direction = 'y')
plot(avg_pr_rcp26_5_raster, main = "Mean Precipitation during 2041/01-2050/12")
writeRaster(avg_pr_rcp26_5_raster, filename = "avg_pr_rcp26_5.nc", format = "CDF", overwrite = TRUE)
#-----------------------205101-206012------------------------------
pr_rcp26_6 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_6.array <- ncvar_get(pr_rcp26_6, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_6<-apply(pr_rcp26_6.array, c(1,2), mean)
avg_pr_rcp26_6_raster <- raster(t(avg_pr_rcp26_6), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_6_raster <- flip(avg_pr_rcp26_6_raster, direction = 'y')
plot(avg_pr_rcp26_6_raster, main = "Mean Precipitation during 2051/01-2060/12")
writeRaster(avg_pr_rcp26_6_raster, filename = "avg_pr_rcp26_6.nc", format = "CDF", overwrite = TRUE)
#-----------------------206101-207012------------------------------
pr_rcp26_7 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_7.array <- ncvar_get(pr_rcp26_7, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_7<-apply(pr_rcp26_7.array, c(1,2), mean)
avg_pr_rcp26_7_raster <- raster(t(avg_pr_rcp26_7), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_7_raster <- flip(avg_pr_rcp26_7_raster, direction = 'y')
plot(avg_pr_rcp26_7_raster, main = "Mean Precipitation during 2061/01-2070/12")
writeRaster(avg_pr_rcp26_7_raster, filename = "avg_pr_rcp26_7.nc", format = "CDF", overwrite = TRUE)
#-----------------------207101-208012------------------------------
pr_rcp26_8 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_8.array <- ncvar_get(pr_rcp26_8, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_8<-apply(pr_rcp26_8.array, c(1,2), mean)
avg_pr_rcp26_8_raster <- raster(t(avg_pr_rcp26_8), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_8_raster <- flip(avg_pr_rcp26_8_raster, direction = 'y')
plot(avg_pr_rcp26_8_raster, main = "Mean Precipitation during 2071/01-2080/12")
writeRaster(avg_pr_rcp26_8_raster, filename = "avg_pr_rcp26_8.nc", format = "CDF", overwrite = TRUE)
#-----------------------208101-209012------------------------------
pr_rcp26_9 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_9.array <- ncvar_get(pr_rcp26_9, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_9<-apply(pr_rcp26_9.array, c(1,2), mean)
avg_pr_rcp26_9_raster <- raster(t(avg_pr_rcp26_9), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_9_raster <- flip(avg_pr_rcp26_9_raster, direction = 'y')
plot(avg_pr_rcp26_9_raster, main = "Mean Precipitation during 2081/01-2090/12")
writeRaster(avg_pr_rcp26_9_raster, filename = "avg_pr_rcp26_9.nc", format = "CDF", overwrite = TRUE)
#-----------------------209101-210012------------------------------
pr_rcp26_10 = nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")
#lon <- ncvar_get(pr_rcp26_1, "lon")
#lat <- ncvar_get(pr_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
pr_rcp26_10.array <- ncvar_get(pr_rcp26_10, "pr")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_pr_rcp26_10 <-apply(pr_rcp26_10.array, c(1,2), mean)
avg_pr_rcp26_10_raster <- raster(t(avg_pr_rcp26_10), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_10_raster <- flip(avg_pr_rcp26_10_raster, direction = 'y')
plot(avg_pr_rcp26_10_raster, main = "Mean Precipitation during 2091/01-2100/12")
writeRaster(avg_pr_rcp26_10_raster, filename = "avg_pr_rcp26_10.nc", format = "CDF", overwrite = TRUE)
##------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/pr-precipitation/rcp26")
avg_pr_rcp26_21_40 <- 0.5*(avg_pr_rcp26_3 + avg_pr_rcp26_4)*60*60*24*30

avg_pr_rcp26_21_40_raster <- raster(t(avg_pr_rcp26_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_21_40_raster <- flip(avg_pr_rcp26_21_40_raster, direction = 'y')
plot(avg_pr_rcp26_21_40_raster, main = "Mean Precipitation during 2021/01-2040/12 (RCP 2.6)")
writeRaster(avg_pr_rcp26_21_40_raster, filename = "avg_pr_rcp26_21_40_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp26_21_30_mean <- mean(avg_pr_rcp26_3)*60*60*24*30
pr_rcp26_31_40_mean <- mean(avg_pr_rcp26_4)*60*60*24*30
#-------------------------204101-206012--------------------------------
avg_pr_rcp26_41_60 <- 0.5*(avg_pr_rcp26_5 + avg_pr_rcp26_6)*60*60*24*30

avg_pr_rcp26_41_60_raster <- raster(t(avg_pr_rcp26_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_41_60_raster <- flip(avg_pr_rcp26_41_60_raster, direction = 'y')
plot(avg_pr_rcp26_41_60_raster, main = "Mean Precipitation during 2041/01-2060/12 (RCP 2.6)")
writeRaster(avg_pr_rcp26_41_60_raster, filename = "avg_pr_rcp26_41_60_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp26_41_50_mean <- mean(avg_pr_rcp26_5)*60*60*24*30
pr_rcp26_51_60_mean <- mean(avg_pr_rcp26_6)*60*60*24*30
#-------------------------206101-208012--------------------------------
avg_pr_rcp26_61_80 <- 0.5*(avg_pr_rcp26_7 + avg_pr_rcp26_8)*60*60*24*30

avg_pr_rcp26_61_80_raster <- raster(t(avg_pr_rcp26_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_61_80_raster <- flip(avg_pr_rcp26_61_80_raster, direction = 'y')
plot(avg_pr_rcp26_61_80_raster, main = "Mean Precipitation during 2061/01-2080/12 (RCP 2.6)")
writeRaster(avg_pr_rcp26_61_80_raster, filename = "avg_pr_rcp26_61_80_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp26_61_70_mean <- mean(avg_pr_rcp26_7)*60*60*24*30
pr_rcp26_71_80_mean <- mean(avg_pr_rcp26_8)*60*60*24*30
#-------------------------208101-210012--------------------------------
avg_pr_rcp26_81_100 <- 0.5*(avg_pr_rcp26_9 + avg_pr_rcp26_10)*60*60*24*30

avg_pr_rcp26_81_100_raster <- raster(t(avg_pr_rcp26_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp26_81_100_raster <- flip(avg_pr_rcp26_81_100_raster, direction = 'y')
plot(avg_pr_rcp26_81_100_raster, main = "Mean Precipitation during 2081/01-2100/12 (RCP 2.6)")
writeRaster(avg_pr_rcp26_81_100_raster, filename = "avg_pr_rcp26_81_100_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp26_81_90_mean <- mean(avg_pr_rcp26_9)*60*60*24*30
pr_rcp26_91_100_mean <- mean(avg_pr_rcp26_10)*60*60*24*30
##-------------------------rcp4.5 scenario--------------------------------------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/pr-precipitation/rcp45")
pr_rcp45_21_30 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
pr_rcp45_31_40 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

pr_rcp45_21_30.array <- ncvar_get(pr_rcp45_21_30, "pr")
pr_rcp45_31_40.array <- ncvar_get(pr_rcp45_31_40, "pr")

# Get the average
avg_pr_rcp45_21_30 <- apply(pr_rcp45_21_30.array, c(1,2), mean)
avg_pr_rcp45_31_40 <- apply(pr_rcp45_31_40.array, c(1,2), mean)
avg_pr_rcp45_21_40 <- 0.5*(avg_pr_rcp45_21_30 + avg_pr_rcp45_31_40)*60*60*24*30

avg_pr_rcp45_21_40_raster <- raster(t(avg_pr_rcp45_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp45_21_40_raster <- flip(avg_pr_rcp45_21_40_raster, direction = 'y')
plot(avg_pr_rcp45_21_40_raster, main = "Mean Precipitation during 2021/01-2040/12 (RCP 4.5)")
writeRaster(avg_pr_rcp45_21_40_raster, filename = "avg_pr_rcp45_21_40_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp45_21_30_mean <- mean(avg_pr_rcp45_21_30)*60*60*24*30
pr_rcp45_31_40_mean <- mean(avg_pr_rcp45_31_40)*60*60*24*30
#-------------------------204101-206012--------------------------------
pr_rcp45_41_50 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
pr_rcp45_51_60 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

pr_rcp45_41_50.array <- ncvar_get(pr_rcp45_41_50, "pr")
pr_rcp45_51_60.array <- ncvar_get(pr_rcp45_51_60, "pr")

# Get the average
avg_pr_rcp45_41_50 <- apply(pr_rcp45_41_50.array, c(1,2), mean)
avg_pr_rcp45_51_60 <- apply(pr_rcp45_51_60.array, c(1,2), mean)
avg_pr_rcp45_41_60 <- 0.5*(avg_pr_rcp45_41_50 + avg_pr_rcp45_51_60)*60*60*24*30

avg_pr_rcp45_41_60_raster <- raster(t(avg_pr_rcp45_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp45_41_60_raster <- flip(avg_pr_rcp45_41_60_raster, direction = 'y')
plot(avg_pr_rcp45_41_60_raster, main = "Mean Precipitation during 2041/01-2060/12 (RCP 4.5)")
writeRaster(avg_pr_rcp45_41_60_raster, filename = "avg_pr_rcp45_41_60_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp45_41_50_mean <- mean(avg_pr_rcp45_41_50)*60*60*24*30
pr_rcp45_51_60_mean <- mean(avg_pr_rcp45_51_60)*60*60*24*30
#-------------------------206101-208012--------------------------------
pr_rcp45_61_70 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
pr_rcp45_71_80 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

pr_rcp45_61_70.array <- ncvar_get(pr_rcp45_61_70, "pr")
pr_rcp45_71_80.array <- ncvar_get(pr_rcp45_71_80, "pr")

# Get the average
avg_pr_rcp45_61_70 <- apply(pr_rcp45_61_70.array, c(1,2), mean)
avg_pr_rcp45_71_80 <- apply(pr_rcp45_71_80.array, c(1,2), mean)
avg_pr_rcp45_61_80 <- 0.5*(avg_pr_rcp45_61_70 + avg_pr_rcp45_71_80)*60*60*24*30

avg_pr_rcp45_61_80_raster <- raster(t(avg_pr_rcp45_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp45_61_80_raster <- flip(avg_pr_rcp45_61_80_raster, direction = 'y')
plot(avg_pr_rcp45_61_80_raster, main = "Mean Precipitation during 2061/01-2080/12 (RCP 4.5)")
writeRaster(avg_pr_rcp45_61_80_raster, filename = "avg_pr_rcp45_61_80_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp45_61_70_mean <- mean(avg_pr_rcp45_61_70)*60*60*24*30
pr_rcp45_71_80_mean <- mean(avg_pr_rcp45_71_80)*60*60*24*30
#-------------------------208101-210012--------------------------------
pr_rcp45_81_90 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
pr_rcp45_91_100 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

pr_rcp45_81_90.array <- ncvar_get(pr_rcp45_81_90, "pr")
pr_rcp45_91_100.array <- ncvar_get(pr_rcp45_91_100, "pr")

# Get the average
avg_pr_rcp45_81_90 <- apply(pr_rcp45_81_90.array, c(1,2), mean)
avg_pr_rcp45_91_100 <- apply(pr_rcp45_91_100.array, c(1,2), mean)
avg_pr_rcp45_81_100 <- 0.5*(avg_pr_rcp45_81_90 + avg_pr_rcp45_91_100)*60*60*24*30

avg_pr_rcp45_81_100_raster <- raster(t(avg_pr_rcp45_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp45_81_100_raster <- flip(avg_pr_rcp45_81_100_raster, direction = 'y')
plot(avg_pr_rcp45_81_100_raster, main = "Mean Precipitation during 2081/01-2100/12 (RCP 4.5)")
writeRaster(avg_pr_rcp45_81_100_raster, filename = "avg_pr_rcp45_81_100_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp45_81_90_mean <- mean(avg_pr_rcp45_61_70)*60*60*24*30
pr_rcp45_91_100_mean <- mean(avg_pr_rcp45_71_80)*60*60*24*30
##-------------------------rcp8.5 scenario--------------------------------------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/pr-precipitation/rcp85")
pr_rcp85_21_30 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
pr_rcp85_31_40 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

pr_rcp85_21_30.array <- ncvar_get(pr_rcp85_21_30, "pr")
pr_rcp85_31_40.array <- ncvar_get(pr_rcp85_31_40, "pr")

# Get the average
avg_pr_rcp85_21_30 <- apply(pr_rcp85_21_30.array, c(1,2), mean)
avg_pr_rcp85_31_40 <- apply(pr_rcp85_31_40.array, c(1,2), mean)
avg_pr_rcp85_21_40 <- 0.5*(avg_pr_rcp85_21_30 + avg_pr_rcp85_31_40)*60*60*24*30

avg_pr_rcp85_21_40_raster <- raster(t(avg_pr_rcp85_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp85_21_40_raster <- flip(avg_pr_rcp85_21_40_raster, direction = 'y')
plot(avg_pr_rcp85_21_40_raster, main = "Mean Precipitation during 2021/01-2040/12 (RCP 8.5)")
writeRaster(avg_pr_rcp85_21_40_raster, filename = "avg_pr_rcp85_21_40_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp85_21_30_mean <- mean(avg_pr_rcp85_21_30)*60*60*24*30
pr_rcp85_31_40_mean <- mean(avg_pr_rcp85_31_40)*60*60*24*30
#-------------------------204101-206012--------------------------------
pr_rcp85_41_50 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
pr_rcp85_51_60 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

pr_rcp85_41_50.array <- ncvar_get(pr_rcp85_41_50, "pr")
pr_rcp85_51_60.array <- ncvar_get(pr_rcp85_51_60, "pr")

# Get the average
avg_pr_rcp85_41_50 <- apply(pr_rcp85_41_50.array, c(1,2), mean)
avg_pr_rcp85_51_60 <- apply(pr_rcp85_51_60.array, c(1,2), mean)
avg_pr_rcp85_41_60 <- 0.5*(avg_pr_rcp85_41_50 + avg_pr_rcp85_51_60)*60*60*24*30

avg_pr_rcp85_41_60_raster <- raster(t(avg_pr_rcp85_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp85_41_60_raster <- flip(avg_pr_rcp85_41_60_raster, direction = 'y')
plot(avg_pr_rcp85_41_60_raster, main = "Mean Precipitation during 2041/01-2060/12 (RCP 8.5)")
writeRaster(avg_pr_rcp85_41_60_raster, filename = "avg_pr_rcp85_41_60_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp85_41_50_mean <- mean(avg_pr_rcp85_41_50)*60*60*24*30
pr_rcp85_51_60_mean <- mean(avg_pr_rcp85_51_60)*60*60*24*30
#-------------------------206101-208012--------------------------------
pr_rcp85_61_70 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
pr_rcp85_71_80 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

pr_rcp85_61_70.array <- ncvar_get(pr_rcp85_61_70, "pr")
pr_rcp85_71_80.array <- ncvar_get(pr_rcp85_71_80, "pr")

# Get the average
avg_pr_rcp85_61_70 <- apply(pr_rcp85_61_70.array, c(1,2), mean)
avg_pr_rcp85_71_80 <- apply(pr_rcp85_71_80.array, c(1,2), mean)
avg_pr_rcp85_61_80 <- 0.5*(avg_pr_rcp85_61_70 + avg_pr_rcp85_71_80)*60*60*24*30

avg_pr_rcp85_61_80_raster <- raster(t(avg_pr_rcp85_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp85_61_80_raster <- flip(avg_pr_rcp85_61_80_raster, direction = 'y')
plot(avg_pr_rcp85_61_80_raster, main = "Mean Precipitation during 2061/01-2080/12 (RCP 8.5)")
writeRaster(avg_pr_rcp85_61_80_raster, filename = "avg_pr_rcp85_61_80_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp85_61_70_mean <- mean(avg_pr_rcp85_61_70)*60*60*24*30
pr_rcp85_71_80_mean <- mean(avg_pr_rcp85_71_80)*60*60*24*30
#-------------------------208101-210012--------------------------------
pr_rcp85_81_90 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
pr_rcp85_91_100 <- nc_open("pr_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

pr_rcp85_81_90.array <- ncvar_get(pr_rcp85_81_90, "pr")
pr_rcp85_91_100.array <- ncvar_get(pr_rcp85_91_100, "pr")

# Get the average
avg_pr_rcp85_81_90 <- apply(pr_rcp85_81_90.array, c(1,2), mean)
avg_pr_rcp85_91_100 <- apply(pr_rcp85_91_100.array, c(1,2), mean)
avg_pr_rcp85_81_100 <- 0.5*(avg_pr_rcp85_81_90 + avg_pr_rcp85_91_100)*60*60*24*30

avg_pr_rcp85_81_100_raster <- raster(t(avg_pr_rcp85_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_pr_rcp85_81_100_raster <- flip(avg_pr_rcp85_81_100_raster, direction = 'y')
plot(avg_pr_rcp85_81_100_raster, main = "Mean Precipitation during 2081/01-2100/12 (RCP 8.5)")
writeRaster(avg_pr_rcp85_81_100_raster, filename = "avg_pr_rcp85_81_100_raster.nc", format = "CDF", overwrite = TRUE)
pr_rcp85_81_90_mean <- mean(avg_pr_rcp85_81_90)*60*60*24*30
pr_rcp85_91_100_mean <- mean(avg_pr_rcp85_91_100)*60*60*24*30
###-------------------------------------------near-surface-air-temp (global warming)---------------------------------------
##---------------------------------------rcp2.6 scenario--------------------------------------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/near-surface-air-temp/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp26.r1i1p1.REMO2009.v1.mon.tas")
tas_rcp26_21_30 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
tas_rcp26_31_40 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

tas_rcp26_21_30.array <- ncvar_get(tas_rcp26_21_30, "tas")
tas_rcp26_31_40.array <- ncvar_get(tas_rcp26_31_40, "tas")

# Get the average
avg_tas_rcp26_21_30 <- apply(tas_rcp26_21_30.array, c(1,2), mean)
avg_tas_rcp26_31_40 <- apply(tas_rcp26_31_40.array, c(1,2), mean)
avg_tas_rcp26_21_40 <- 0.5*(avg_tas_rcp26_21_30 + avg_tas_rcp26_31_40) - 273.15

avg_tas_rcp26_21_40_raster <- raster(t(avg_tas_rcp26_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp26_21_40_raster <- flip(avg_tas_rcp26_21_40_raster, direction = 'y')
plot(avg_tas_rcp26_21_40_raster, main = "Mean Surface Air Temperature during 2021/01-2040/12 (RCP 2.6)")
writeRaster(avg_tas_rcp26_21_40_raster, filename = "avg_tas_rcp26_21_40_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp26_21_30_mean <- mean(avg_tas_rcp26_21_30) - 273.15
tas_rcp26_31_40_mean <- mean(avg_tas_rcp26_31_40) - 273.15
#-------------------------204101-206012--------------------------------
tas_rcp26_41_50 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
tas_rcp26_51_60 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

tas_rcp26_41_50.array <- ncvar_get(tas_rcp26_41_50, "tas")
tas_rcp26_51_60.array <- ncvar_get(tas_rcp26_51_60, "tas")

# Get the average
avg_tas_rcp26_41_50 <- apply(tas_rcp26_41_50.array, c(1,2), mean)
avg_tas_rcp26_51_60 <- apply(tas_rcp26_51_60.array, c(1,2), mean)
avg_tas_rcp26_41_60 <- 0.5*(avg_tas_rcp26_41_50 + avg_tas_rcp26_51_60) - 273.15

avg_tas_rcp26_41_60_raster <- raster(t(avg_tas_rcp26_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp26_41_60_raster <- flip(avg_tas_rcp26_41_60_raster, direction = 'y')
plot(avg_tas_rcp26_41_60_raster, main = "Mean Surface Air Temperature during 2041/01-2060/12 (RCP 2.6)")
writeRaster(avg_tas_rcp26_41_60_raster, filename = "avg_tas_rcp26_41_60_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp26_41_50_mean <- mean(avg_tas_rcp26_41_50) - 273.15
tas_rcp26_51_60_mean <- mean(avg_tas_rcp26_51_60) - 273.15
#-------------------------206101-208012--------------------------------
tas_rcp26_61_70 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
tas_rcp26_71_80 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

tas_rcp26_61_70.array <- ncvar_get(tas_rcp26_61_70, "tas")
tas_rcp26_71_80.array <- ncvar_get(tas_rcp26_71_80, "tas")

# Get the average
avg_tas_rcp26_61_70 <- apply(tas_rcp26_61_70.array, c(1,2), mean)
avg_tas_rcp26_71_80 <- apply(tas_rcp26_71_80.array, c(1,2), mean)
avg_tas_rcp26_61_80 <- 0.5*(avg_tas_rcp26_61_70 + avg_tas_rcp26_71_80) - 273.15

avg_tas_rcp26_61_80_raster <- raster(t(avg_tas_rcp26_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp26_61_80_raster <- flip(avg_tas_rcp26_61_80_raster, direction = 'y')
plot(avg_tas_rcp26_61_80_raster, main = "Mean Surface Air Temperature during 2061/01-2080/12 (RCP 2.6)")
writeRaster(avg_tas_rcp26_61_80_raster, filename = "avg_tas_rcp26_61_80_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp26_61_70_mean <- mean(avg_tas_rcp26_61_70) - 273.15
tas_rcp26_71_80_mean <- mean(avg_tas_rcp26_71_80) - 273.15
#-------------------------208101-210012--------------------------------
tas_rcp26_81_90 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
tas_rcp26_91_100 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

tas_rcp26_81_90.array <- ncvar_get(tas_rcp26_81_90, "tas")
tas_rcp26_91_100.array <- ncvar_get(tas_rcp26_91_100, "tas")

# Get the average
avg_tas_rcp26_81_90 <- apply(tas_rcp26_81_90.array, c(1,2), mean)
avg_tas_rcp26_91_100 <- apply(tas_rcp26_91_100.array, c(1,2), mean)
avg_tas_rcp26_81_100 <- 0.5*(avg_tas_rcp26_81_90 + avg_tas_rcp26_91_100) - 273.15

avg_tas_rcp26_81_100_raster <- raster(t(avg_tas_rcp26_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp26_81_100_raster <- flip(avg_tas_rcp26_81_100_raster, direction = 'y')
plot(avg_tas_rcp26_81_100_raster, main = "Mean Surface Air Temperature during 2081/01-2100/12 (RCP 2.6)")
writeRaster(avg_tas_rcp26_81_100_raster, filename = "avg_tas_rcp26_81_100_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp26_81_90_mean <- mean(avg_tas_rcp26_81_90) - 273.15
tas_rcp26_91_100_mean <- mean(avg_tas_rcp26_91_100) - 273.15
##-------------------------------------rcp4.5 scenario----------------------------------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/near-surface-air-temp/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp45.r1i1p1.REMO2009.v1.mon.tas")
tas_rcp45_21_30 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
tas_rcp45_31_40 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

tas_rcp45_21_30.array <- ncvar_get(tas_rcp45_21_30, "tas")
tas_rcp45_31_40.array <- ncvar_get(tas_rcp45_31_40, "tas")

# Get the average
avg_tas_rcp45_21_30 <- apply(tas_rcp45_21_30.array, c(1,2), mean)
avg_tas_rcp45_31_40 <- apply(tas_rcp45_31_40.array, c(1,2), mean)
avg_tas_rcp45_21_40 <- 0.5*(avg_tas_rcp45_21_30 + avg_tas_rcp45_31_40) - 273.15

avg_tas_rcp45_21_40_raster <- raster(t(avg_tas_rcp45_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp45_21_40_raster <- flip(avg_tas_rcp45_21_40_raster, direction = 'y')
plot(avg_tas_rcp45_21_40_raster, main = "Mean Surface Air Temperature during 2021/01-2040/12 (RCP 4.5)")
writeRaster(avg_tas_rcp45_21_40_raster, filename = "avg_tas_rcp45_21_40_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp45_21_30_mean <- mean(avg_tas_rcp45_21_30) - 273.15
tas_rcp45_31_40_mean <- mean(avg_tas_rcp45_31_40) - 273.15
#-------------------------204101-206012--------------------------------
tas_rcp45_41_50 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
tas_rcp45_51_60 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

tas_rcp45_41_50.array <- ncvar_get(tas_rcp45_41_50, "tas")
tas_rcp45_51_60.array <- ncvar_get(tas_rcp45_51_60, "tas")

# Get the average
avg_tas_rcp45_41_50 <- apply(tas_rcp45_41_50.array, c(1,2), mean)
avg_tas_rcp45_51_60 <- apply(tas_rcp45_51_60.array, c(1,2), mean)
avg_tas_rcp45_41_60 <- 0.5*(avg_tas_rcp45_41_50 + avg_tas_rcp45_51_60) - 273.15

avg_tas_rcp45_41_60_raster <- raster(t(avg_tas_rcp45_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp45_41_60_raster <- flip(avg_tas_rcp45_41_60_raster, direction = 'y')
plot(avg_tas_rcp45_41_60_raster, main = "Mean Surface Air Temperature during 2041/01-2060/12 (RCP 4.5)")
writeRaster(avg_tas_rcp45_41_60_raster, filename = "avg_tas_rcp45_41_60_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp45_41_50_mean <- mean(avg_tas_rcp45_41_50) - 273.15
tas_rcp45_51_60_mean <- mean(avg_tas_rcp45_51_60) - 273.15

#-------------------------206101-208012--------------------------------
tas_rcp45_61_70 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
tas_rcp45_71_80 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

tas_rcp45_61_70.array <- ncvar_get(tas_rcp45_61_70, "tas")
tas_rcp45_71_80.array <- ncvar_get(tas_rcp45_71_80, "tas")

# Get the average
avg_tas_rcp45_61_70 <- apply(tas_rcp45_61_70.array, c(1,2), mean)
avg_tas_rcp45_71_80 <- apply(tas_rcp45_71_80.array, c(1,2), mean)
avg_tas_rcp45_61_80 <- 0.5*(avg_tas_rcp45_61_70 + avg_tas_rcp45_71_80) - 273.15

avg_tas_rcp45_61_80_raster <- raster(t(avg_tas_rcp45_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp45_61_80_raster <- flip(avg_tas_rcp45_61_80_raster, direction = 'y')
plot(avg_tas_rcp45_61_80_raster, main = "Mean Surface Air Temperature during 2061/01-2080/12 (RCP 4.5)")
writeRaster(avg_tas_rcp45_61_80_raster, filename = "avg_tas_rcp45_61_80_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp45_61_70_mean <- mean(avg_tas_rcp45_61_70) - 273.15
tas_rcp45_71_80_mean <- mean(avg_tas_rcp45_71_80) - 273.15

#-------------------------208101-210012--------------------------------
tas_rcp45_81_90 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
tas_rcp45_91_100 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

tas_rcp45_81_90.array <- ncvar_get(tas_rcp45_81_90, "tas")
tas_rcp45_91_100.array <- ncvar_get(tas_rcp45_91_100, "tas")

# Get the average
avg_tas_rcp45_81_90 <- apply(tas_rcp45_81_90.array, c(1,2), mean)
avg_tas_rcp45_91_100 <- apply(tas_rcp45_91_100.array, c(1,2), mean)
avg_tas_rcp45_81_100 <- 0.5*(avg_tas_rcp45_81_90 + avg_tas_rcp45_91_100) - 273.15

avg_tas_rcp45_81_100_raster <- raster(t(avg_tas_rcp45_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp45_81_100_raster <- flip(avg_tas_rcp45_81_100_raster, direction = 'y')
plot(avg_tas_rcp45_81_100_raster, main = "Mean Surface Air Temperature during 2081/01-2100/12 (RCP 4.5)")
writeRaster(avg_tas_rcp45_81_100_raster, filename = "avg_tas_rcp45_81_100_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp45_81_90_mean <- mean(avg_tas_rcp45_81_90) - 273.15
tas_rcp45_91_100_mean <- mean(avg_tas_rcp45_91_100) - 273.15

##-------------------------------------rcp8.5 scenario----------------------------------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/near-surface-air-temp/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp85.r1i1p1.REMO2009.v1.mon.tas")
tas_rcp85_21_30 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
tas_rcp85_31_40 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

tas_rcp85_21_30.array <- ncvar_get(tas_rcp85_21_30, "tas")
tas_rcp85_31_40.array <- ncvar_get(tas_rcp85_31_40, "tas")

# Get the average
avg_tas_rcp85_21_30 <- apply(tas_rcp85_21_30.array, c(1,2), mean)
avg_tas_rcp85_31_40 <- apply(tas_rcp85_31_40.array, c(1,2), mean)
avg_tas_rcp85_21_40 <- 0.5*(avg_tas_rcp85_21_30 + avg_tas_rcp85_31_40) - 273.15

avg_tas_rcp85_21_40_raster <- raster(t(avg_tas_rcp85_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp85_21_40_raster <- flip(avg_tas_rcp85_21_40_raster, direction = 'y')
plot(avg_tas_rcp85_21_40_raster, main = "Mean Surface Air Temperature during 2021/01-2040/12 (RCP 8.5)")
writeRaster(avg_tas_rcp85_21_40_raster, filename = "avg_tas_rcp85_21_40_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp85_21_30_mean <- mean(avg_tas_rcp85_21_30) - 273.15
tas_rcp85_31_40_mean <- mean(avg_tas_rcp85_31_40) - 273.15

#-------------------------204101-206012--------------------------------
tas_rcp85_41_50 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
tas_rcp85_51_60 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

tas_rcp85_41_50.array <- ncvar_get(tas_rcp85_41_50, "tas")
tas_rcp85_51_60.array <- ncvar_get(tas_rcp85_51_60, "tas")

# Get the average
avg_tas_rcp85_41_50 <- apply(tas_rcp85_41_50.array, c(1,2), mean)
avg_tas_rcp85_51_60 <- apply(tas_rcp85_51_60.array, c(1,2), mean)
avg_tas_rcp85_41_60 <- 0.5*(avg_tas_rcp85_41_50 + avg_tas_rcp85_51_60) - 273.15

avg_tas_rcp85_41_60_raster <- raster(t(avg_tas_rcp85_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp85_41_60_raster <- flip(avg_tas_rcp85_41_60_raster, direction = 'y')
plot(avg_tas_rcp85_41_60_raster, main = "Mean Surface Air Temperature during 2041/01-2060/12 (RCP 8.5)")
writeRaster(avg_tas_rcp85_41_60_raster, filename = "avg_tas_rcp85_41_60_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp85_41_50_mean <- mean(avg_tas_rcp85_41_50) - 273.15
tas_rcp85_51_60_mean <- mean(avg_tas_rcp85_51_60) - 273.15

#-------------------------206101-208012--------------------------------
tas_rcp85_61_70 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
tas_rcp85_71_80 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

tas_rcp85_61_70.array <- ncvar_get(tas_rcp85_61_70, "tas")
tas_rcp85_71_80.array <- ncvar_get(tas_rcp85_71_80, "tas")

# Get the average
avg_tas_rcp85_61_70 <- apply(tas_rcp85_61_70.array, c(1,2), mean)
avg_tas_rcp85_71_80 <- apply(tas_rcp85_71_80.array, c(1,2), mean)
avg_tas_rcp85_61_80 <- 0.5*(avg_tas_rcp85_61_70 + avg_tas_rcp85_71_80) - 273.15

avg_tas_rcp85_61_80_raster <- raster(t(avg_tas_rcp85_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp85_61_80_raster <- flip(avg_tas_rcp85_61_80_raster, direction = 'y')
plot(avg_tas_rcp85_61_80_raster, main = "Mean Surface Air Temperature during 2061/01-2080/12 (RCP 8.5)")
writeRaster(avg_tas_rcp85_61_80_raster, filename = "avg_tas_rcp85_61_80_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp85_61_70_mean <- mean(avg_tas_rcp85_61_70) - 273.15
tas_rcp85_71_80_mean <- mean(avg_tas_rcp85_71_80) - 273.15

#-------------------------208101-210012--------------------------------
tas_rcp85_81_90 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
tas_rcp85_91_100 <- nc_open("tas_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

tas_rcp85_81_90.array <- ncvar_get(tas_rcp85_81_90, "tas")
tas_rcp85_91_100.array <- ncvar_get(tas_rcp85_91_100, "tas")

# Get the average
avg_tas_rcp85_81_90 <- apply(tas_rcp85_81_90.array, c(1,2), mean)
avg_tas_rcp85_91_100 <- apply(tas_rcp85_91_100.array, c(1,2), mean)
avg_tas_rcp85_81_100 <- 0.5*(avg_tas_rcp85_81_90 + avg_tas_rcp85_91_100) - 273.15

avg_tas_rcp85_81_100_raster <- raster(t(avg_tas_rcp85_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tas_rcp85_81_100_raster <- flip(avg_tas_rcp85_81_100_raster, direction = 'y')
plot(avg_tas_rcp85_81_100_raster, main = "Mean Surface Air Temperature during 2081/01-2100/12 (RCP 8.5)")
writeRaster(avg_tas_rcp85_81_100_raster, filename = "avg_tas_rcp85_81_100_raster.nc", format = "CDF", overwrite = TRUE)
tas_rcp85_81_90_mean <- mean(avg_tas_rcp85_81_90) - 273.15
tas_rcp85_91_100_mean <- mean(avg_tas_rcp85_91_100) - 273.15

###----------------------------------------daily-maximum-temp (heat wave)---------------------------------
##---------------------------------------rcp2.6 scenario--------------------------------------------------------
#-------------------------200601-202012--------------------------------
tasmax_rcp26_06_10 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_200601-201012.nc")
tasmax_rcp26_11_20 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_201101-202012.nc")

tasmax_rcp26_06_10.array <- ncvar_get(tasmax_rcp26_06_10, "tasmax")
tasmax_rcp26_11_20.array <- ncvar_get(tasmax_rcp26_11_20, "tasmax")
tasmax_rcp26_06_20.array <- abind(tasmax_rcp26_06_10.array, tasmax_rcp26_11_20.array, along = 3)

# Get the 95th percentile of the tasmax
quan95_tasmax_rcp26_06_20 <- apply(tasmax_rcp26_06_20.array, c(1,2), quantile, 0.95) - 273.15

quan95_tasmax_rcp26_06_20_raster <- raster(t(quan95_tasmax_rcp26_06_20), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
quan95_tasmax_rcp26_06_20_raster <- flip(quan95_tasmax_rcp26_06_20_raster, direction = 'y')
plot(quan95_tasmax_rcp26_06_20_raster)
writeRaster(quan95_tasmax_rcp26_06_20_raster, filename = 'quan95_tasmax_rcp26_06_20_raster.nc', format = "CDF", overwrite =  TRUE)

#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/daily-max-near-surface-temp/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp26.r1i1p1.REMO2009.v1.mon.tasmax")
tasmax_rcp26_21_30 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
tasmax_rcp26_31_40 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

tasmax_rcp26_21_30.array <- ncvar_get(tasmax_rcp26_21_30, "tasmax")
tasmax_rcp26_31_40.array <- ncvar_get(tasmax_rcp26_31_40, "tasmax")

# Get the average
avg_tasmax_rcp26_21_30 <- apply(tasmax_rcp26_21_30.array, c(1,2), mean)
avg_tasmax_rcp26_31_40 <- apply(tasmax_rcp26_31_40.array, c(1,2), mean)
avg_tasmax_rcp26_21_40 <- 0.5*(avg_tasmax_rcp26_21_30 + avg_tasmax_rcp26_31_40) - 273.15

avg_tasmax_rcp26_21_40_raster <- raster(t(avg_tasmax_rcp26_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp26_21_40_raster <- flip(avg_tasmax_rcp26_21_40_raster, direction = 'y')
plot(avg_tasmax_rcp26_21_40_raster, main = "Daily Maximum Surface Air Temperature during 2021/01-2040/12 (RCP 2.6)")
writeRaster(avg_tasmax_rcp26_21_40_raster, filename = "avg_tasmax_rcp26_21_40_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp26_21_30_mean <- mean(avg_tasmax_rcp26_21_30) - 273.15
tasmax_rcp26_31_40_mean <- mean(avg_tasmax_rcp26_31_40) - 273.15

#-------------------------204101-206012--------------------------------
tasmax_rcp26_41_50 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
tasmax_rcp26_51_60 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

tasmax_rcp26_41_50.array <- ncvar_get(tasmax_rcp26_41_50, "tasmax")
tasmax_rcp26_51_60.array <- ncvar_get(tasmax_rcp26_51_60, "tasmax")

# Get the average
avg_tasmax_rcp26_41_50 <- apply(tasmax_rcp26_41_50.array, c(1,2), mean)
avg_tasmax_rcp26_51_60 <- apply(tasmax_rcp26_51_60.array, c(1,2), mean)
avg_tasmax_rcp26_41_60 <- 0.5*(avg_tasmax_rcp26_41_50 + avg_tasmax_rcp26_51_60) - 273.15

avg_tasmax_rcp26_41_60_raster <- raster(t(avg_tasmax_rcp26_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp26_41_60_raster <- flip(avg_tasmax_rcp26_41_60_raster, direction = 'y')
plot(avg_tasmax_rcp26_41_60_raster, main = "Daily Maximum Surface Air Temperature during 2041/01-2060/12 (RCP 2.6)")
writeRaster(avg_tasmax_rcp26_41_60_raster, filename = "avg_tasmax_rcp26_41_60_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp26_41_50_mean <- mean(avg_tasmax_rcp26_41_50) - 273.15
tasmax_rcp26_51_60_mean <- mean(avg_tasmax_rcp26_51_60) - 273.15

#-------------------------206101-208012--------------------------------
tasmax_rcp26_61_70 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
tasmax_rcp26_71_80 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

tasmax_rcp26_61_70.array <- ncvar_get(tasmax_rcp26_61_70, "tasmax")
tasmax_rcp26_71_80.array <- ncvar_get(tasmax_rcp26_71_80, "tasmax")

# Get the average
avg_tasmax_rcp26_61_70 <- apply(tasmax_rcp26_61_70.array, c(1,2), mean)
avg_tasmax_rcp26_71_80 <- apply(tasmax_rcp26_71_80.array, c(1,2), mean)
avg_tasmax_rcp26_61_80 <- 0.5*(avg_tasmax_rcp26_61_70 + avg_tasmax_rcp26_71_80) - 273.15

avg_tasmax_rcp26_61_80_raster <- raster(t(avg_tasmax_rcp26_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp26_61_80_raster <- flip(avg_tasmax_rcp26_61_80_raster, direction = 'y')
plot(avg_tasmax_rcp26_61_80_raster, main = "Daily Maximum Surface Air Temperature during 2061/01-2080/12 (RCP 2.6)")
writeRaster(avg_tasmax_rcp26_61_80_raster, filename = "avg_tasmax_rcp26_61_80_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp26_61_70_mean <- mean(avg_tasmax_rcp26_61_70) - 273.15
tasmax_rcp26_71_80_mean <- mean(avg_tasmax_rcp26_71_80) - 273.15

#-------------------------208101-210012--------------------------------
tasmax_rcp26_81_90 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
tasmax_rcp26_91_100 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

tasmax_rcp26_81_90.array <- ncvar_get(tasmax_rcp26_81_90, "tasmax")
tasmax_rcp26_91_100.array <- ncvar_get(tasmax_rcp26_91_100, "tasmax")

# Get the average
avg_tasmax_rcp26_81_90 <- apply(tasmax_rcp26_81_90.array, c(1,2), mean)
avg_tasmax_rcp26_91_100 <- apply(tasmax_rcp26_91_100.array, c(1,2), mean)
avg_tasmax_rcp26_81_100 <- 0.5*(avg_tasmax_rcp26_81_90 + avg_tasmax_rcp26_91_100) - 273.15

avg_tasmax_rcp26_81_100_raster <- raster(t(avg_tasmax_rcp26_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp26_81_100_raster <- flip(avg_tasmax_rcp26_81_100_raster, direction = 'y')
plot(avg_tasmax_rcp26_81_100_raster, main = "Daily Maximum Surface Air Temperature during 2081/01-2100/12 (RCP 2.6)")
writeRaster(avg_tasmax_rcp26_81_100_raster, filename = "avg_tasmax_rcp26_81_100_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp26_81_90_mean <- mean(avg_tasmax_rcp26_81_90) - 273.15
tasmax_rcp26_91_100_mean <- mean(avg_tasmax_rcp26_91_100) - 273.15

##-------------------------------------rcp4.5 scenario----------------------------------------------------
#-------------------------200601-202012--------------------------------
tasmax_rcp45_06_10 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_200601-201012.nc")
tasmax_rcp45_11_20 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_201101-202012.nc")

tasmax_rcp45_06_10.array <- ncvar_get(tasmax_rcp45_06_10, "tasmax")
tasmax_rcp45_11_20.array <- ncvar_get(tasmax_rcp45_11_20, "tasmax")
tasmax_rcp45_06_20.array <- abind(tasmax_rcp45_06_10.array, tasmax_rcp45_11_20.array, along = 3)

# Get the 95th percentile of the tasmax
quan95_tasmax_rcp45_06_20 <- apply(tasmax_rcp45_06_20.array, c(1,2), quantile, 0.95) - 273.15

quan95_tasmax_rcp45_06_20_raster <- raster(t(quan95_tasmax_rcp45_06_20), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
quan95_tasmax_rcp45_06_20_raster <- flip(quan95_tasmax_rcp45_06_20_raster, direction = 'y')
plot(quan95_tasmax_rcp45_06_20_raster)
writeRaster(quan95_tasmax_rcp45_06_20_raster, filename = 'quan95_tasmax_rcp45_06_20_raster.nc', format = "CDF", overwrite =  TRUE)
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/daily-max-near-surface-temp/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp45.r1i1p1.REMO2009.v1.mon.tasmax")
tasmax_rcp45_21_30 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
tasmax_rcp45_31_40 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

tasmax_rcp45_21_30.array <- ncvar_get(tasmax_rcp45_21_30, "tasmax")
tasmax_rcp45_31_40.array <- ncvar_get(tasmax_rcp45_31_40, "tasmax")

# Get the average
avg_tasmax_rcp45_21_30 <- apply(tasmax_rcp45_21_30.array, c(1,2), mean)
avg_tasmax_rcp45_31_40 <- apply(tasmax_rcp45_31_40.array, c(1,2), mean)
avg_tasmax_rcp45_21_40 <- 0.5*(avg_tasmax_rcp45_21_30 + avg_tasmax_rcp45_31_40) - 273.15

avg_tasmax_rcp45_21_40_raster <- raster(t(avg_tasmax_rcp45_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp45_21_40_raster <- flip(avg_tasmax_rcp45_21_40_raster, direction = 'y')
plot(avg_tasmax_rcp45_21_40_raster, main = "Daily Maximum Surface Air Temperature during 2021/01-2040/12 (RCP 4.5)")
writeRaster(avg_tasmax_rcp45_21_40_raster, filename = "avg_tasmax_rcp45_21_40_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp45_21_30_mean <- mean(avg_tasmax_rcp45_21_30) - 273.15
tasmax_rcp45_31_40_mean <- mean(avg_tasmax_rcp45_31_40) - 273.15

#-------------------------204101-206012--------------------------------
tasmax_rcp45_41_50 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
tasmax_rcp45_51_60 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

tasmax_rcp45_41_50.array <- ncvar_get(tasmax_rcp45_41_50, "tasmax")
tasmax_rcp45_51_60.array <- ncvar_get(tasmax_rcp45_51_60, "tasmax")

# Get the average
avg_tasmax_rcp45_41_50 <- apply(tasmax_rcp45_41_50.array, c(1,2), mean)
avg_tasmax_rcp45_51_60 <- apply(tasmax_rcp45_51_60.array, c(1,2), mean)
avg_tasmax_rcp45_41_60 <- 0.5*(avg_tasmax_rcp45_41_50 + avg_tasmax_rcp45_51_60) - 273.15

avg_tasmax_rcp45_41_60_raster <- raster(t(avg_tasmax_rcp45_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp45_41_60_raster <- flip(avg_tasmax_rcp45_41_60_raster, direction = 'y')
plot(avg_tasmax_rcp45_41_60_raster, main = "Daily Maximum Surface Air Temperature during 2041/01-2060/12 (RCP 4.5)")
writeRaster(avg_tasmax_rcp45_41_60_raster, filename = "avg_tasmax_rcp45_41_60_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp45_41_50_mean <- mean(avg_tasmax_rcp45_41_50) - 273.15
tasmax_rcp45_51_60_mean <- mean(avg_tasmax_rcp45_51_60) - 273.15

#-------------------------206101-208012--------------------------------
tasmax_rcp45_61_70 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
tasmax_rcp45_71_80 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

tasmax_rcp45_61_70.array <- ncvar_get(tasmax_rcp45_61_70, "tasmax")
tasmax_rcp45_71_80.array <- ncvar_get(tasmax_rcp45_71_80, "tasmax")

# Get the average
avg_tasmax_rcp45_61_70 <- apply(tasmax_rcp45_61_70.array, c(1,2), mean)
avg_tasmax_rcp45_71_80 <- apply(tasmax_rcp45_71_80.array, c(1,2), mean)
avg_tasmax_rcp45_61_80 <- 0.5*(avg_tasmax_rcp45_61_70 + avg_tasmax_rcp45_71_80) - 273.15

avg_tasmax_rcp45_61_80_raster <- raster(t(avg_tasmax_rcp45_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp45_61_80_raster <- flip(avg_tasmax_rcp45_61_80_raster, direction = 'y')
plot(avg_tasmax_rcp45_61_80_raster, main = "Daily Maximum Surface Air Temperature during 2061/01-2080/12 (RCP 4.5)")
writeRaster(avg_tasmax_rcp45_61_80_raster, filename = "avg_tasmax_rcp45_61_80_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp45_61_70_mean <- mean(avg_tasmax_rcp45_61_70) - 273.15
tasmax_rcp45_71_80_mean <- mean(avg_tasmax_rcp45_71_80) - 273.15

#-------------------------208101-210012--------------------------------
tasmax_rcp45_81_90 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
tasmax_rcp45_91_100 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

tasmax_rcp45_81_90.array <- ncvar_get(tasmax_rcp45_81_90, "tasmax")
tasmax_rcp45_91_100.array <- ncvar_get(tasmax_rcp45_91_100, "tasmax")

# Get the average
avg_tasmax_rcp45_81_90 <- apply(tasmax_rcp45_81_90.array, c(1,2), mean)
avg_tasmax_rcp45_91_100 <- apply(tasmax_rcp45_91_100.array, c(1,2), mean)
avg_tasmax_rcp45_81_100 <- 0.5*(avg_tasmax_rcp45_81_90 + avg_tasmax_rcp45_91_100) - 273.15

avg_tasmax_rcp45_81_100_raster <- raster(t(avg_tasmax_rcp45_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp45_81_100_raster <- flip(avg_tasmax_rcp45_81_100_raster, direction = 'y')
plot(avg_tasmax_rcp45_81_100_raster, main = "Daily Maximum Surface Air Temperature during 2081/01-2100/12 (RCP 4.5)")
writeRaster(avg_tasmax_rcp45_81_100_raster, filename = "avg_tasmax_rcp45_81_100_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp45_81_90_mean <- mean(avg_tasmax_rcp45_81_90) - 273.15
tasmax_rcp45_91_100_mean <- mean(avg_tasmax_rcp45_91_100) - 273.15

##-------------------------------------rcp8.5 scenario----------------------------------------------------
#-------------------------200601-202012--------------------------------
tasmax_rcp85_06_10 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_200601-201012.nc")
tasmax_rcp85_11_20 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_201101-202012.nc")

tasmax_rcp85_06_10.array <- ncvar_get(tasmax_rcp85_06_10, "tasmax")
tasmax_rcp85_11_20.array <- ncvar_get(tasmax_rcp85_11_20, "tasmax")
tasmax_rcp85_06_20.array <- abind(tasmax_rcp85_06_10.array, tasmax_rcp85_11_20.array, along = 3)

# Get the 95th percentile of the tasmax
quan95_tasmax_rcp85_06_20 <- apply(tasmax_rcp85_06_20.array, c(1,2), quantile, 0.95) - 273.15

quan95_tasmax_rcp85_06_20_raster <- raster(t(quan95_tasmax_rcp85_06_20), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
quan95_tasmax_rcp85_06_20_raster <- flip(quan95_tasmax_rcp85_06_20_raster, direction = 'y')
plot(quan95_tasmax_rcp85_06_20_raster)
writeRaster(quan95_tasmax_rcp85_06_20_raster, filename = 'quan95_tasmax_rcp85_06_20_raster.nc', format = "CDF", overwrite =  TRUE)
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/daily-max-near-surface-temp/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp85.r1i1p1.REMO2009.v1.mon.tasmax")
tasmax_rcp85_21_30 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
tasmax_rcp85_31_40 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

tasmax_rcp85_21_30.array <- ncvar_get(tasmax_rcp85_21_30, "tasmax")
tasmax_rcp85_31_40.array <- ncvar_get(tasmax_rcp85_31_40, "tasmax")

# Get the average
avg_tasmax_rcp85_21_30 <- apply(tasmax_rcp85_21_30.array, c(1,2), mean)
avg_tasmax_rcp85_31_40 <- apply(tasmax_rcp85_31_40.array, c(1,2), mean)
avg_tasmax_rcp85_21_40 <- 0.5*(avg_tasmax_rcp85_21_30 + avg_tasmax_rcp85_31_40) - 273.15

avg_tasmax_rcp85_21_40_raster <- raster(t(avg_tasmax_rcp85_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp85_21_40_raster <- flip(avg_tasmax_rcp85_21_40_raster, direction = 'y')
plot(avg_tasmax_rcp85_21_40_raster, main = "Daily Maximum Surface Air Temperature during 2021/01-2040/12 (RCP 8.5)")
writeRaster(avg_tasmax_rcp85_21_40_raster, filename = "avg_tasmax_rcp85_21_40_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp85_21_30_mean <- mean(avg_tasmax_rcp85_21_30) - 273.15
tasmax_rcp85_31_40_mean <- mean(avg_tasmax_rcp85_31_40) - 273.15

#-------------------------204101-206012--------------------------------
tasmax_rcp85_41_50 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
tasmax_rcp85_51_60 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

tasmax_rcp85_41_50.array <- ncvar_get(tasmax_rcp85_41_50, "tasmax")
tasmax_rcp85_51_60.array <- ncvar_get(tasmax_rcp85_51_60, "tasmax")

# Get the average
avg_tasmax_rcp85_41_50 <- apply(tasmax_rcp85_41_50.array, c(1,2), mean)
avg_tasmax_rcp85_51_60 <- apply(tasmax_rcp85_51_60.array, c(1,2), mean)
avg_tasmax_rcp85_41_60 <- 0.5*(avg_tasmax_rcp85_41_50 + avg_tasmax_rcp85_51_60) - 273.15

avg_tasmax_rcp85_41_60_raster <- raster(t(avg_tasmax_rcp85_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp85_41_60_raster <- flip(avg_tasmax_rcp85_41_60_raster, direction = 'y')
plot(avg_tasmax_rcp85_41_60_raster, main = "Daily Maximum Surface Air Temperature during 2041/01-2060/12 (RCP 8.5)")
writeRaster(avg_tasmax_rcp85_41_60_raster, filename = "avg_tasmax_rcp85_41_60_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp85_41_50_mean <- mean(avg_tasmax_rcp85_41_50) - 273.15
tasmax_rcp85_51_60_mean <- mean(avg_tasmax_rcp85_51_60) - 273.15

#-------------------------206101-208012--------------------------------
tasmax_rcp85_61_70 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
tasmax_rcp85_71_80 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

tasmax_rcp85_61_70.array <- ncvar_get(tasmax_rcp85_61_70, "tasmax")
tasmax_rcp85_71_80.array <- ncvar_get(tasmax_rcp85_71_80, "tasmax")

# Get the average
avg_tasmax_rcp85_61_70 <- apply(tasmax_rcp85_61_70.array, c(1,2), mean)
avg_tasmax_rcp85_71_80 <- apply(tasmax_rcp85_71_80.array, c(1,2), mean)
avg_tasmax_rcp85_61_80 <- 0.5*(avg_tasmax_rcp85_61_70 + avg_tasmax_rcp85_71_80) - 273.15

avg_tasmax_rcp85_61_80_raster <- raster(t(avg_tasmax_rcp85_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp85_61_80_raster <- flip(avg_tasmax_rcp85_61_80_raster, direction = 'y')
plot(avg_tasmax_rcp85_61_80_raster, main = "Daily Maximum Surface Air Temperature during 2061/01-2080/12 (RCP 8.5)")
writeRaster(avg_tasmax_rcp85_61_80_raster, filename = "avg_tasmax_rcp85_61_80_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp85_61_70_mean <- mean(avg_tasmax_rcp85_61_70) - 273.15
tasmax_rcp85_71_80_mean <- mean(avg_tasmax_rcp85_71_80) - 273.15

#-------------------------208101-210012--------------------------------
tasmax_rcp85_81_90 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
tasmax_rcp85_91_100 <- nc_open("tasmax_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

tasmax_rcp85_81_90.array <- ncvar_get(tasmax_rcp85_81_90, "tasmax")
tasmax_rcp85_91_100.array <- ncvar_get(tasmax_rcp85_91_100, "tasmax")

# Get the average
avg_tasmax_rcp85_81_90 <- apply(tasmax_rcp85_81_90.array, c(1,2), mean)
avg_tasmax_rcp85_91_100 <- apply(tasmax_rcp85_91_100.array, c(1,2), mean)
avg_tasmax_rcp85_81_100 <- 0.5*(avg_tasmax_rcp85_81_90 + avg_tasmax_rcp85_91_100) - 273.15

avg_tasmax_rcp85_81_100_raster <- raster(t(avg_tasmax_rcp85_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_tasmax_rcp85_81_100_raster <- flip(avg_tasmax_rcp85_81_100_raster, direction = 'y')
plot(avg_tasmax_rcp85_81_100_raster, main = "Daily Maximum Surface Air Temperature during 2081/01-2100/12 (RCP 8.5)")
writeRaster(avg_tasmax_rcp85_81_100_raster, filename = "avg_tasmax_rcp85_81_100_raster.nc", format = "CDF", overwrite = TRUE)
tasmax_rcp85_81_90_mean <- mean(avg_tasmax_rcp85_81_90) - 273.15
tasmax_rcp85_91_100_mean <- mean(avg_tasmax_rcp85_91_100) - 273.15


# Precipitation Plot
## RCP 2.6
pr_rcp26 <- c(pr_rcp26_21_30_mean, pr_rcp26_31_40_mean, pr_rcp26_41_50_mean, pr_rcp26_51_60_mean, pr_rcp26_61_70_mean, pr_rcp26_71_80_mean, pr_rcp26_81_90_mean, pr_rcp26_91_100_mean)
## RCP 4.5
pr_rcp45 <- c(pr_rcp45_21_30_mean, pr_rcp45_31_40_mean, pr_rcp45_41_50_mean, pr_rcp45_51_60_mean, pr_rcp45_61_70_mean, pr_rcp45_71_80_mean, pr_rcp45_81_90_mean, pr_rcp45_91_100_mean)
## RCP8.5
pr_rcp85 <- c(pr_rcp85_21_30_mean, pr_rcp85_31_40_mean, pr_rcp85_41_50_mean, pr_rcp85_51_60_mean, pr_rcp85_61_70_mean, pr_rcp85_71_80_mean, pr_rcp85_81_90_mean, pr_rcp85_91_100_mean)

# Mean surface air temp plot
## RCP 2.6
tas_rcp26 <- c(tas_rcp26_21_30_mean, tas_rcp26_31_40_mean, tas_rcp26_41_50_mean, tas_rcp26_51_60_mean, tas_rcp26_61_70_mean, tas_rcp26_71_80_mean, tas_rcp26_81_90_mean, tas_rcp26_91_100_mean)
## RCP 4.5
tas_rcp45 <- c(tas_rcp45_21_30_mean, tas_rcp45_31_40_mean, tas_rcp45_41_50_mean, tas_rcp45_51_60_mean, tas_rcp45_61_70_mean, tas_rcp45_71_80_mean, tas_rcp45_81_90_mean, tas_rcp45_91_100_mean)
## RCP 8.5
tas_rcp85 <- c(tas_rcp85_21_30_mean, tas_rcp85_31_40_mean, tas_rcp85_41_50_mean, tas_rcp85_51_60_mean, tas_rcp85_61_70_mean, tas_rcp85_71_80_mean, tas_rcp85_81_90_mean, tas_rcp85_91_100_mean)

# Daily Maximum surface air temp plot
## RCP 2.6
tasmax_rcp26 <- c(tasmax_rcp26_21_30_mean, tasmax_rcp26_31_40_mean, tasmax_rcp26_41_50_mean, tasmax_rcp26_51_60_mean, tasmax_rcp26_61_70_mean, tasmax_rcp26_71_80_mean, tasmax_rcp26_81_90_mean, tasmax_rcp26_91_100_mean)
## RCP 4.5
tasmax_rcp45 <- c(tasmax_rcp45_21_30_mean, tasmax_rcp45_31_40_mean, tasmax_rcp45_41_50_mean, tasmax_rcp45_51_60_mean, tasmax_rcp45_61_70_mean, tasmax_rcp45_71_80_mean, tasmax_rcp45_81_90_mean, tasmax_rcp45_91_100_mean)
## RCP 8.5
tasmax_rcp85 <- c(tasmax_rcp85_21_30_mean, tasmax_rcp85_31_40_mean, tasmax_rcp85_41_50_mean, tasmax_rcp85_51_60_mean, tasmax_rcp85_61_70_mean, tasmax_rcp85_71_80_mean, tasmax_rcp85_81_90_mean, tasmax_rcp85_91_100_mean)


###-------------------------------Evaporation--------------------------------------------------------
##-------------------------rcp2.6 scenario--------------------------------------------------------
#-----------------------------------200601-201012----------------------------
setwd("~/Desktop/CO2-project/Project/data/evaporation/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp26.r1i1p1.REMO2009.v1.mon.evspsbl")
evspsbl_rcp26_1 = nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_200601-201012.nc")
lon <- ncvar_get(evspsbl_rcp26_1, "lon")
lat <- ncvar_get(evspsbl_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
evspsbl_rcp26_1.array <- ncvar_get(evspsbl_rcp26_1, "evspsbl")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_evspsbl_rcp26_1<-apply(evspsbl_rcp26_1.array, c(1,2), mean)
avg_evspsbl_rcp26_1_raster <- raster(t(avg_evspsbl_rcp26_1), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_1_raster <- flip(avg_evspsbl_rcp26_1_raster, direction = 'y')
plot(avg_evspsbl_rcp26_1_raster, main = "Mean Evaporation during 2006/01-2010/12")
writeRaster(avg_evspsbl_rcp26_1_raster, filename = "avg_evspsbl_rcp26_1.nc", format = "CDF", overwrite = TRUE)
#-----------------------------------201101-202012----------------------------
evspsbl_rcp26_2 = nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_201101-202012.nc")
#lon <- ncvar_get(evspsbl_rcp26_1, "lon")
#lat <- ncvar_get(evspsbl_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
evspsbl_rcp26_2.array <- ncvar_get(evspsbl_rcp26_2, "evspsbl")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_evspsbl_rcp26_2<-apply(evspsbl_rcp26_2.array, c(1,2), mean)
avg_evspsbl_rcp26_2_raster <- raster(t(avg_evspsbl_rcp26_2), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_2_raster <- flip(avg_evspsbl_rcp26_2_raster, direction = 'y')
plot(avg_evspsbl_rcp26_2_raster, main = "Mean Evaporation during 2011/01-2020/12")
writeRaster(avg_evspsbl_rcp26_2_raster, filename = "avg_evspsbl_rcp26_2.nc", format = "CDF", overwrite = TRUE)
#-----------------------------------202101-203012----------------------------
evspsbl_rcp26_3 = nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
#lon <- ncvar_get(evspsbl_rcp26_1, "lon")
#lat <- ncvar_get(evspsbl_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
evspsbl_rcp26_3.array <- ncvar_get(evspsbl_rcp26_3, "evspsbl")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_evspsbl_rcp26_3<-apply(evspsbl_rcp26_3.array, c(1,2), mean)
avg_evspsbl_rcp26_3_raster <- raster(t(avg_evspsbl_rcp26_3), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_3_raster <- flip(avg_evspsbl_rcp26_3_raster, direction = 'y')
plot(avg_evspsbl_rcp26_3_raster, main = "Mean Evaporation during 2021/01-2030/12")
writeRaster(avg_evspsbl_rcp26_3_raster, filename = "avg_evspsbl_rcp26_3.nc", format = "CDF", overwrite = TRUE)
#-----------------------------------203101-204012----------------------------
evspsbl_rcp26_4 = nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")
#lon <- ncvar_get(evspsbl_rcp26_1, "lon")
#lat <- ncvar_get(evspsbl_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
evspsbl_rcp26_4.array <- ncvar_get(evspsbl_rcp26_4, "evspsbl")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_evspsbl_rcp26_4<-apply(evspsbl_rcp26_4.array, c(1,2), mean)
avg_evspsbl_rcp26_4_raster <- raster(t(avg_evspsbl_rcp26_4), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_4_raster <- flip(avg_evspsbl_rcp26_4_raster, direction = 'y')
plot(avg_evspsbl_rcp26_4_raster, main = "Mean Evaporation during 2031/01-2040/12")
writeRaster(avg_evspsbl_rcp26_4_raster, filename = "avg_evspsbl_rcp26_4.nc", format = "CDF", overwrite = TRUE)
#-----------------------------------204101-205012----------------------------
evspsbl_rcp26_5 = nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
#lon <- ncvar_get(evspsbl_rcp26_1, "lon")
#lat <- ncvar_get(evspsbl_rcp26_1, "lat", verbose = F)
#t <- ncvar_get(r, "time_bnds")
evspsbl_rcp26_5.array <- ncvar_get(evspsbl_rcp26_5, "evspsbl")
# pr_rcp26_1.slice <- pr_rcp26_1.array[,,1]
# Get the average
avg_evspsbl_rcp26_5<-apply(evspsbl_rcp26_5.array, c(1,2), mean)
avg_evspsbl_rcp26_5_raster <- raster(t(avg_evspsbl_rcp26_5), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_5_raster <- flip(avg_evspsbl_rcp26_5_raster, direction = 'y')
plot(avg_evspsbl_rcp26_5_raster, main = "Mean Evaporation during 2041/01-2050/12")
writeRaster(avg_evspsbl_rcp26_5_raster, filename = "avg_evspsbl_rcp26_5.nc", format = "CDF", overwrite = TRUE)


#-------------------------rcp 2.6 scenario-----------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/evaporation/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp26.r1i1p1.REMO2009.v1.mon.evspsbl")
evspsbl_rcp26_21_30 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
evspsbl_rcp26_31_40 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

evspsbl_rcp26_21_30.array <- ncvar_get(evspsbl_rcp26_21_30, "evspsbl")
evspsbl_rcp26_31_40.array <- ncvar_get(evspsbl_rcp26_31_40, "evspsbl")

# Get the average
avg_evspsbl_rcp26_21_30 <- apply(evspsbl_rcp26_21_30.array, c(1,2), mean)
avg_evspsbl_rcp26_31_40 <- apply(evspsbl_rcp26_31_40.array, c(1,2), mean)
avg_evspsbl_rcp26_21_40 <- 0.5*(avg_evspsbl_rcp26_21_30 + avg_evspsbl_rcp26_31_40)*60*60*24*30

avg_evspsbl_rcp26_21_40_raster <- raster(t(avg_evspsbl_rcp26_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_21_40_raster <- flip(avg_evspsbl_rcp26_21_40_raster, direction = 'y')
plot(avg_evspsbl_rcp26_21_40_raster, main = "Mean Evaporation during 2021/01-2040/12 (RCP 2.6)")
writeRaster(avg_evspsbl_rcp26_21_40_raster, filename = "avg_evspsbl_rcp26_21_40_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp26_21_30_mean <- mean(avg_evspsbl_rcp26_21_30)*60*60*24*30
evspsbl_rcp26_31_40_mean <- mean(avg_evspsbl_rcp26_31_40)*60*60*24*30

#-----------------------204101-206012------------------------------------
evspsbl_rcp26_41_50 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
evspsbl_rcp26_51_60 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

evspsbl_rcp26_41_50.array <- ncvar_get(evspsbl_rcp26_41_50, "evspsbl")
evspsbl_rcp26_51_60.array <- ncvar_get(evspsbl_rcp26_51_60, "evspsbl")

# Get the average
avg_evspsbl_rcp26_41_50 <- apply(evspsbl_rcp26_41_50.array, c(1,2), mean)
avg_evspsbl_rcp26_51_60 <- apply(evspsbl_rcp26_51_60.array, c(1,2), mean)
avg_evspsbl_rcp26_41_60 <- 0.5*(avg_evspsbl_rcp26_41_50 + avg_evspsbl_rcp26_51_60)*60*60*24*30

avg_evspsbl_rcp26_41_60_raster <- raster(t(avg_evspsbl_rcp26_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_41_60_raster <- flip(avg_evspsbl_rcp26_41_60_raster, direction = 'y')
plot(avg_evspsbl_rcp26_41_60_raster, main = "Mean Evaporation during 2041/01-2060/12 (RCP 2.6)")
writeRaster(avg_evspsbl_rcp26_41_60_raster, filename = "avg_evspsbl_rcp26_41_60_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp26_41_50_mean <- mean(avg_evspsbl_rcp26_41_50)*60*60*24*30
evspsbl_rcp26_51_60_mean <- mean(avg_evspsbl_rcp26_51_60)*60*60*24*30

#-----------------------206101-208012------------------------------------
evspsbl_rcp26_61_70 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
evspsbl_rcp26_71_80 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

evspsbl_rcp26_61_70.array <- ncvar_get(evspsbl_rcp26_61_70, "evspsbl")
evspsbl_rcp26_71_80.array <- ncvar_get(evspsbl_rcp26_71_80, "evspsbl")

# Get the average
avg_evspsbl_rcp26_61_70 <- apply(evspsbl_rcp26_61_70.array, c(1,2), mean)
avg_evspsbl_rcp26_71_80 <- apply(evspsbl_rcp26_71_80.array, c(1,2), mean)
avg_evspsbl_rcp26_61_80 <- 0.5*(avg_evspsbl_rcp26_61_70 + avg_evspsbl_rcp26_71_80)*60*60*24*30

avg_evspsbl_rcp26_61_80_raster <- raster(t(avg_evspsbl_rcp26_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_61_80_raster <- flip(avg_evspsbl_rcp26_61_80_raster, direction = 'y')
plot(avg_evspsbl_rcp26_61_80_raster, main = "Mean Evaporation during 2061/01-2080/12 (RCP 2.6)")
writeRaster(avg_evspsbl_rcp26_61_80_raster, filename = "avg_evspsbl_rcp26_61_80_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp26_61_70_mean <- mean(avg_evspsbl_rcp26_61_70)*60*60*24*30
evspsbl_rcp26_71_80_mean <- mean(avg_evspsbl_rcp26_71_80)*60*60*24*30

#-----------------------208101-210012-------------------------------------
evspsbl_rcp26_81_90 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
evspsbl_rcp26_91_100 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp26_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

evspsbl_rcp26_81_90.array <- ncvar_get(evspsbl_rcp26_81_90, "evspsbl")
evspsbl_rcp26_91_100.array <- ncvar_get(evspsbl_rcp26_91_100, "evspsbl")

# Get the average
avg_evspsbl_rcp26_81_90 <- apply(evspsbl_rcp26_81_90.array, c(1,2), mean)
avg_evspsbl_rcp26_91_100 <- apply(evspsbl_rcp26_91_100.array, c(1,2), mean)
avg_evspsbl_rcp26_81_100 <- 0.5*(avg_evspsbl_rcp26_81_90 + avg_evspsbl_rcp26_91_100)*60*60*24*30

avg_evspsbl_rcp26_81_100_raster <- raster(t(avg_evspsbl_rcp26_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp26_81_100_raster <- flip(avg_evspsbl_rcp26_81_100_raster, direction = 'y')
plot(avg_evspsbl_rcp26_81_100_raster, main = "Mean Evaporation during 2081/01-2100/12 (RCP 2.6)")
writeRaster(avg_evspsbl_rcp26_81_100_raster, filename = "avg_evspsbl_rcp26_81_100_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp26_81_90_mean <- mean(avg_evspsbl_rcp26_81_90)*60*60*24*30
evspsbl_rcp26_91_100_mean <- mean(avg_evspsbl_rcp26_91_100)*60*60*24*30

##-------------------------rcp4.5 scenario--------------------------------------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/evaporation/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp45.r1i1p1.REMO2009.v1.mon.evspsbl")
evspsbl_rcp45_21_30 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
evspsbl_rcp45_31_40 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

evspsbl_rcp45_21_30.array <- ncvar_get(evspsbl_rcp45_21_30, "evspsbl")
evspsbl_rcp45_31_40.array <- ncvar_get(evspsbl_rcp45_31_40, "evspsbl")

# Get the average
avg_evspsbl_rcp45_21_30 <- apply(evspsbl_rcp45_21_30.array, c(1,2), mean)
avg_evspsbl_rcp45_31_40 <- apply(evspsbl_rcp45_31_40.array, c(1,2), mean)
avg_evspsbl_rcp45_21_40 <- 0.5*(avg_evspsbl_rcp45_21_30 + avg_evspsbl_rcp45_31_40)*60*60*24*30

avg_evspsbl_rcp45_21_40_raster <- raster(t(avg_evspsbl_rcp45_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp45_21_40_raster <- flip(avg_evspsbl_rcp45_21_40_raster, direction = 'y')
plot(avg_evspsbl_rcp45_21_40_raster, main = "Mean Evaporation during 2021/01-2040/12 (RCP 4.5)")
writeRaster(avg_evspsbl_rcp45_21_40_raster, filename = "avg_evspsbl_rcp45_21_40_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp45_21_30_mean <- mean(avg_evspsbl_rcp45_21_30)*60*60*24*30
evspsbl_rcp45_31_40_mean <- mean(avg_evspsbl_rcp45_31_40)*60*60*24*30

#-----------------------204101-206012------------------------------------
evspsbl_rcp45_41_50 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
evspsbl_rcp45_51_60 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

evspsbl_rcp45_41_50.array <- ncvar_get(evspsbl_rcp45_41_50, "evspsbl")
evspsbl_rcp45_51_60.array <- ncvar_get(evspsbl_rcp45_51_60, "evspsbl")

# Get the average
avg_evspsbl_rcp45_41_50 <- apply(evspsbl_rcp45_41_50.array, c(1,2), mean)
avg_evspsbl_rcp45_51_60 <- apply(evspsbl_rcp45_51_60.array, c(1,2), mean)
avg_evspsbl_rcp45_41_60 <- 0.5*(avg_evspsbl_rcp45_41_50 + avg_evspsbl_rcp45_51_60)*60*60*24*30

avg_evspsbl_rcp45_41_60_raster <- raster(t(avg_evspsbl_rcp45_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp45_41_60_raster <- flip(avg_evspsbl_rcp45_41_60_raster, direction = 'y')
plot(avg_evspsbl_rcp45_41_60_raster, main = "Mean Evaporation during 2041/01-2060/12 (RCP 4.5)")
writeRaster(avg_evspsbl_rcp45_41_60_raster, filename = "avg_evspsbl_rcp45_41_60_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp45_41_50_mean <- mean(avg_evspsbl_rcp45_41_50)*60*60*24*30
evspsbl_rcp45_51_60_mean <- mean(avg_evspsbl_rcp45_51_60)*60*60*24*30

#-----------------------206101-208012------------------------------------
evspsbl_rcp45_61_70 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
evspsbl_rcp45_71_80 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

evspsbl_rcp45_61_70.array <- ncvar_get(evspsbl_rcp45_61_70, "evspsbl")
evspsbl_rcp45_71_80.array <- ncvar_get(evspsbl_rcp45_71_80, "evspsbl")

# Get the average
avg_evspsbl_rcp45_61_70 <- apply(evspsbl_rcp45_61_70.array, c(1,2), mean)
avg_evspsbl_rcp45_71_80 <- apply(evspsbl_rcp45_71_80.array, c(1,2), mean)
avg_evspsbl_rcp45_61_80 <- 0.5*(avg_evspsbl_rcp45_61_70 + avg_evspsbl_rcp45_71_80)*60*60*24*30

avg_evspsbl_rcp45_61_80_raster <- raster(t(avg_evspsbl_rcp45_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp45_61_80_raster <- flip(avg_evspsbl_rcp45_61_80_raster, direction = 'y')
plot(avg_evspsbl_rcp45_61_80_raster, main = "Mean Evaporation during 2061/01-2080/12 (RCP 4.5)")
writeRaster(avg_evspsbl_rcp45_61_80_raster, filename = "avg_evspsbl_rcp45_61_80_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp45_61_70_mean <- mean(avg_evspsbl_rcp45_61_70)*60*60*24*30
evspsbl_rcp45_71_80_mean <- mean(avg_evspsbl_rcp45_71_80)*60*60*24*30

#-----------------------208101-210012-------------------------------------
evspsbl_rcp45_81_90 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
evspsbl_rcp45_91_100 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp45_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

evspsbl_rcp45_81_90.array <- ncvar_get(evspsbl_rcp45_81_90, "evspsbl")
evspsbl_rcp45_91_100.array <- ncvar_get(evspsbl_rcp45_91_100, "evspsbl")

# Get the average
avg_evspsbl_rcp45_81_90 <- apply(evspsbl_rcp45_81_90.array, c(1,2), mean)
avg_evspsbl_rcp45_91_100 <- apply(evspsbl_rcp45_91_100.array, c(1,2), mean)
avg_evspsbl_rcp45_81_100 <- 0.5*(avg_evspsbl_rcp45_81_90 + avg_evspsbl_rcp45_91_100)*60*60*24*30

avg_evspsbl_rcp45_81_100_raster <- raster(t(avg_evspsbl_rcp45_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp45_81_100_raster <- flip(avg_evspsbl_rcp45_81_100_raster, direction = 'y')
plot(avg_evspsbl_rcp45_81_100_raster, main = "Mean Evaporation during 2081/01-2100/12 (RCP 4.5)")
writeRaster(avg_evspsbl_rcp45_81_100_raster, filename = "avg_evspsbl_rcp45_81_100_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp45_81_90_mean <- mean(avg_evspsbl_rcp45_81_90)*60*60*24*30
evspsbl_rcp45_91_100_mean <- mean(avg_evspsbl_rcp45_91_100)*60*60*24*30

##-------------------------rcp8.5 scenario--------------------------------------------------------
#-------------------------202101-204012--------------------------------
setwd("~/Desktop/CO2-project/Project/data/evaporation/cordex.output.AFR-44.MPI-CSC.MPI-M-MPI-ESM-LR.rcp85.r1i1p1.REMO2009.v1.mon.evspsbl")
evspsbl_rcp85_21_30 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_202101-203012.nc")
evspsbl_rcp85_31_40 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_203101-204012.nc")

evspsbl_rcp85_21_30.array <- ncvar_get(evspsbl_rcp85_21_30, "evspsbl")
evspsbl_rcp85_31_40.array <- ncvar_get(evspsbl_rcp85_31_40, "evspsbl")

# Get the average
avg_evspsbl_rcp85_21_30 <- apply(evspsbl_rcp85_21_30.array, c(1,2), mean)
avg_evspsbl_rcp85_31_40 <- apply(evspsbl_rcp85_31_40.array, c(1,2), mean)
avg_evspsbl_rcp85_21_40 <- 0.5*(avg_evspsbl_rcp85_21_30 + avg_evspsbl_rcp85_31_40)*60*60*24*30

avg_evspsbl_rcp85_21_40_raster <- raster(t(avg_evspsbl_rcp85_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp85_21_40_raster <- flip(avg_evspsbl_rcp85_21_40_raster, direction = 'y')
plot(avg_evspsbl_rcp85_21_40_raster, main = "Mean Evaporation during 2021/01-2040/12 (RCP 8.5)")
writeRaster(avg_evspsbl_rcp85_21_40_raster, filename = "avg_evspsbl_rcp85_21_40_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp85_21_30_mean <- mean(avg_evspsbl_rcp85_21_30)*60*60*24*30
evspsbl_rcp85_31_40_mean <- mean(avg_evspsbl_rcp85_31_40)*60*60*24*30

#-----------------------204101-206012------------------------------------
evspsbl_rcp85_41_50 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_204101-205012.nc")
evspsbl_rcp85_51_60 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_205101-206012.nc")

evspsbl_rcp85_41_50.array <- ncvar_get(evspsbl_rcp85_41_50, "evspsbl")
evspsbl_rcp85_51_60.array <- ncvar_get(evspsbl_rcp85_51_60, "evspsbl")

# Get the average
avg_evspsbl_rcp85_41_50 <- apply(evspsbl_rcp85_41_50.array, c(1,2), mean)
avg_evspsbl_rcp85_51_60 <- apply(evspsbl_rcp85_51_60.array, c(1,2), mean)
avg_evspsbl_rcp85_41_60 <- 0.5*(avg_evspsbl_rcp85_41_50 + avg_evspsbl_rcp85_51_60)*60*60*24*30

avg_evspsbl_rcp85_41_60_raster <- raster(t(avg_evspsbl_rcp85_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp85_41_60_raster <- flip(avg_evspsbl_rcp85_41_60_raster, direction = 'y')
plot(avg_evspsbl_rcp85_41_60_raster, main = "Mean Evaporation during 2041/01-2060/12 (RCP 8.5)")
writeRaster(avg_evspsbl_rcp85_41_60_raster, filename = "avg_evspsbl_rcp85_41_60_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp85_41_50_mean <- mean(avg_evspsbl_rcp85_41_50)*60*60*24*30
evspsbl_rcp85_51_60_mean <- mean(avg_evspsbl_rcp85_51_60)*60*60*24*30

#-----------------------206101-208012------------------------------------
evspsbl_rcp85_61_70 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
evspsbl_rcp85_71_80 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

evspsbl_rcp85_61_70.array <- ncvar_get(evspsbl_rcp85_61_70, "evspsbl")
evspsbl_rcp85_71_80.array <- ncvar_get(evspsbl_rcp85_71_80, "evspsbl")

# Get the average
avg_evspsbl_rcp85_61_70 <- apply(evspsbl_rcp85_61_70.array, c(1,2), mean)
avg_evspsbl_rcp85_71_80 <- apply(evspsbl_rcp85_71_80.array, c(1,2), mean)
avg_evspsbl_rcp85_61_80 <- 0.5*(avg_evspsbl_rcp85_61_70 + avg_evspsbl_rcp85_71_80)*60*60*24*30

avg_evspsbl_rcp85_61_80_raster <- raster(t(avg_evspsbl_rcp85_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp85_61_80_raster <- flip(avg_evspsbl_rcp85_61_80_raster, direction = 'y')
plot(avg_evspsbl_rcp85_61_80_raster, main = "Mean Evaporation during 2061/01-2080/12 (RCP 8.5)")
writeRaster(avg_evspsbl_rcp85_61_80_raster, filename = "avg_evspsbl_rcp85_61_80_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp85_61_70_mean <- mean(avg_evspsbl_rcp85_61_70)*60*60*24*30
evspsbl_rcp85_71_80_mean <- mean(avg_evspsbl_rcp85_71_80)*60*60*24*30

#-----------------------206101-208012------------------------------------
evspsbl_rcp85_61_70 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_206101-207012.nc")
evspsbl_rcp85_71_80 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_207101-208012.nc")

evspsbl_rcp85_61_70.array <- ncvar_get(evspsbl_rcp85_61_70, "evspsbl")
evspsbl_rcp85_71_80.array <- ncvar_get(evspsbl_rcp85_71_80, "evspsbl")

# Get the average
avg_evspsbl_rcp85_61_70 <- apply(evspsbl_rcp85_61_70.array, c(1,2), mean)
avg_evspsbl_rcp85_71_80 <- apply(evspsbl_rcp85_71_80.array, c(1,2), mean)
avg_evspsbl_rcp85_61_80 <- 0.5*(avg_evspsbl_rcp85_61_70 + avg_evspsbl_rcp85_71_80)*60*60*24*30

avg_evspsbl_rcp85_61_80_raster <- raster(t(avg_evspsbl_rcp85_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp85_61_80_raster <- flip(avg_evspsbl_rcp85_61_80_raster, direction = 'y')
plot(avg_evspsbl_rcp85_61_80_raster, main = "Mean Evaporation during 2061/01-2080/12 (RCP 8.5)")
writeRaster(avg_evspsbl_rcp85_61_80_raster, filename = "avg_evspsbl_rcp85_61_80_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp85_61_70_mean <- mean(avg_evspsbl_rcp85_61_70)*60*60*24*30
evspsbl_rcp85_71_80_mean <- mean(avg_evspsbl_rcp85_71_80)*60*60*24*30

#-----------------------208101-210012-------------------------------------
evspsbl_rcp85_81_90 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_208101-209012.nc")
evspsbl_rcp85_91_100 <- nc_open("evspsbl_AFR-44_MPI-M-MPI-ESM-LR_rcp85_r1i1p1_MPI-CSC-REMO2009_v1_mon_209101-210012.nc")

evspsbl_rcp85_81_90.array <- ncvar_get(evspsbl_rcp85_81_90, "evspsbl")
evspsbl_rcp85_91_100.array <- ncvar_get(evspsbl_rcp85_91_100, "evspsbl")

# Get the average
avg_evspsbl_rcp85_81_90 <- apply(evspsbl_rcp85_81_90.array, c(1,2), mean)
avg_evspsbl_rcp85_91_100 <- apply(evspsbl_rcp85_91_100.array, c(1,2), mean)
avg_evspsbl_rcp85_81_100 <- 0.5*(avg_evspsbl_rcp85_81_90 + avg_evspsbl_rcp85_91_100)*60*60*24*30

avg_evspsbl_rcp85_81_100_raster <- raster(t(avg_evspsbl_rcp85_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_evspsbl_rcp85_81_100_raster <- flip(avg_evspsbl_rcp85_81_100_raster, direction = 'y')
plot(avg_evspsbl_rcp85_81_100_raster, main = "Mean Evaporation during 2081/01-2100/12 (RCP 8.5)")
writeRaster(avg_evspsbl_rcp85_81_100_raster, filename = "avg_evspsbl_rcp85_81_100_raster.nc", format = "CDF", overwrite = TRUE)
evspsbl_rcp85_81_90_mean <- mean(avg_evspsbl_rcp85_81_90)*60*60*24*30
evspsbl_rcp85_91_100_mean <- mean(avg_evspsbl_rcp85_91_100)*60*60*24*30


# Evaporation Plot
## RCP 2.6
evspsbl_rcp26 <- c(evspsbl_rcp26_21_30_mean, evspsbl_rcp26_31_40_mean, evspsbl_rcp26_41_50_mean, evspsbl_rcp26_51_60_mean, evspsbl_rcp26_61_70_mean, evspsbl_rcp26_71_80_mean, evspsbl_rcp26_81_90_mean, evspsbl_rcp26_91_100_mean)
## RCP 4.5
evspsbl_rcp45 <- c(evspsbl_rcp45_21_30_mean, evspsbl_rcp45_31_40_mean, evspsbl_rcp45_41_50_mean, evspsbl_rcp45_51_60_mean, evspsbl_rcp45_61_70_mean, evspsbl_rcp45_71_80_mean, evspsbl_rcp45_81_90_mean, evspsbl_rcp45_91_100_mean)
## RCP8.5
evspsbl_rcp85 <- c(evspsbl_rcp85_21_30_mean, evspsbl_rcp85_31_40_mean, evspsbl_rcp85_41_50_mean, evspsbl_rcp85_51_60_mean, evspsbl_rcp85_61_70_mean, evspsbl_rcp85_71_80_mean, evspsbl_rcp85_81_90_mean, evspsbl_rcp85_91_100_mean)





###-------------------------------Water Balance = Precipitation - Evaporation--------------------------------------------------------
##-------------------------------------------rcp 2.6-------------------------------------------------------
setwd("~/Desktop/CO2-project/Project/data/water-balance/rcp2.6")
avg_wtblc_rcp26_21_40 <- avg_pr_rcp26_21_40 - avg_evspsbl_rcp26_21_40
avg_wtblc_rcp26_41_60 <- avg_pr_rcp26_41_60 - avg_evspsbl_rcp26_41_60
avg_wtblc_rcp26_61_80 <- avg_pr_rcp26_61_80 - avg_evspsbl_rcp26_61_80
avg_wtblc_rcp26_81_100 <- avg_pr_rcp26_81_100 - avg_evspsbl_rcp26_81_100


avg_wtblc_rcp26_21_40_raster <- raster(t(avg_wtblc_rcp26_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp26_21_40_raster <- flip(avg_wtblc_rcp26_21_40_raster, direction = 'y')

avg_wtblc_rcp26_41_60_raster <- raster(t(avg_wtblc_rcp26_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp26_41_60_raster <- flip(avg_wtblc_rcp26_41_60_raster, direction = 'y')

avg_wtblc_rcp26_61_80_raster <- raster(t(avg_wtblc_rcp26_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp26_61_80_raster <- flip(avg_wtblc_rcp26_61_80_raster, direction = 'y')

avg_wtblc_rcp26_81_100_raster <- raster(t(avg_wtblc_rcp26_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp26_81_100_raster <- flip(avg_wtblc_rcp26_81_100_raster, direction = 'y')

writeRaster(avg_wtblc_rcp26_21_40_raster, filename = "avg_wtblc_rcp26_21_40_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp26_41_60_raster, filename = "avg_wtblc_rcp26_41_60_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp26_61_80_raster, filename = "avg_wtblc_rcp26_61_80_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp26_81_100_raster, filename = "avg_wtblc_rcp26_81_100_raster.nc", format = "CDF", overwrite = TRUE)
##-------------------------------------------rcp 4.5-------------------------------------------------------
setwd("~/Desktop/CO2-project/Project/data/water-balance/rcp4.5")
avg_wtblc_rcp45_21_40 <- avg_pr_rcp45_21_40 - avg_evspsbl_rcp45_21_40
avg_wtblc_rcp45_41_60 <- avg_pr_rcp45_41_60 - avg_evspsbl_rcp45_41_60
avg_wtblc_rcp45_61_80 <- avg_pr_rcp45_61_80 - avg_evspsbl_rcp45_61_80
avg_wtblc_rcp45_81_100 <- avg_pr_rcp45_81_100 - avg_evspsbl_rcp45_81_100


avg_wtblc_rcp45_21_40_raster <- raster(t(avg_wtblc_rcp45_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp45_21_40_raster <- flip(avg_wtblc_rcp45_21_40_raster, direction = 'y')

avg_wtblc_rcp45_41_60_raster <- raster(t(avg_wtblc_rcp45_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp45_41_60_raster <- flip(avg_wtblc_rcp45_41_60_raster, direction = 'y')

avg_wtblc_rcp45_61_80_raster <- raster(t(avg_wtblc_rcp45_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp45_61_80_raster <- flip(avg_wtblc_rcp45_61_80_raster, direction = 'y')

avg_wtblc_rcp45_81_100_raster <- raster(t(avg_wtblc_rcp45_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp45_81_100_raster <- flip(avg_wtblc_rcp45_81_100_raster, direction = 'y')

writeRaster(avg_wtblc_rcp45_21_40_raster, filename = "avg_wtblc_rcp45_21_40_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp45_41_60_raster, filename = "avg_wtblc_rcp45_41_60_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp45_61_80_raster, filename = "avg_wtblc_rcp45_61_80_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp45_81_100_raster, filename = "avg_wtblc_rcp45_81_100_raster.nc", format = "CDF", overwrite = TRUE)

##-------------------------------------------rcp 8.5-------------------------------------------------------
setwd("~/Desktop/CO2-project/Project/data/water-balance/rcp8.5")
avg_wtblc_rcp85_21_40 <- avg_pr_rcp85_21_40 - avg_evspsbl_rcp85_21_40
avg_wtblc_rcp85_41_60 <- avg_pr_rcp85_41_60 - avg_evspsbl_rcp85_41_60
avg_wtblc_rcp85_61_80 <- avg_pr_rcp85_61_80 - avg_evspsbl_rcp85_61_80
avg_wtblc_rcp85_81_100 <- avg_pr_rcp85_81_100 - avg_evspsbl_rcp85_81_100


avg_wtblc_rcp85_21_40_raster <- raster(t(avg_wtblc_rcp85_21_40), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp85_21_40_raster <- flip(avg_wtblc_rcp85_21_40_raster, direction = 'y')

avg_wtblc_rcp85_41_60_raster <- raster(t(avg_wtblc_rcp85_41_60), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp85_41_60_raster <- flip(avg_wtblc_rcp85_41_60_raster, direction = 'y')

avg_wtblc_rcp85_61_80_raster <- raster(t(avg_wtblc_rcp85_61_80), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp85_61_80_raster <- flip(avg_wtblc_rcp85_61_80_raster, direction = 'y')

avg_wtblc_rcp85_81_100_raster <- raster(t(avg_wtblc_rcp85_81_100), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
avg_wtblc_rcp85_81_100_raster <- flip(avg_wtblc_rcp85_81_100_raster, direction = 'y')

writeRaster(avg_wtblc_rcp85_21_40_raster, filename = "avg_wtblc_rcp85_21_40_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp85_41_60_raster, filename = "avg_wtblc_rcp85_41_60_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp85_61_80_raster, filename = "avg_wtblc_rcp85_61_80_raster.nc", format = "CDF", overwrite = TRUE)
writeRaster(avg_wtblc_rcp85_81_100_raster, filename = "avg_wtblc_rcp85_81_100_raster.nc", format = "CDF", overwrite = TRUE)






















