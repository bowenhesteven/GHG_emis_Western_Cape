library(ncdf4)
library(raster)
library(rgdal)
library(ggplot2)

# setup working directory


# Precipitation
r = nc_open("0601_1012.nc")
lon <- ncvar_get(r, "lon")
lat <- ncvar_get(r, "lat", verbose = F)
t <- ncvar_get(r, "time_bnds")
pre.array <- ncvar_get(r, "pr")
pre.slice <- pre.array[,,1]
# Get the average

dim(pre.slice)
p <- raster(t(pre.slice), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
p <- flip(p, direction = 'y')

plot(p)

africa_boundary <- st_read("~/Desktop/africa-places-shape/places.shp")

ggplot() + 
  geom_sf(data = africa_boundary, size = 3, color = "black", fill = "cyan1") + 
  ggtitle("Africa Continent") + 
  coord_sf()
