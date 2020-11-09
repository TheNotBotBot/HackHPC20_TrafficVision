library("httr")
library("jsonlite")
library("tidyverse")
library("rjson")


install.packages("httr")
install.packages("jsonlite")
install.packages("tidyverse")
install.packages("rjson")

# Get the data from API
username <- "HackHPC"
password <- "TeamUser"
res = GET("https://tndemo.trafficvision.com:4443/realtime_data",authenticate(username,password))

# read url and convert to data.frame
res
# Convert to text format
traffic <- content(res,"text")
traffic

get_traffic_json <- fromJSON(traffic)
get_traffic_df <- as.data.frame(get_traffic_json)

# data-frame with 54 columns
View(get_traffic_df)

# Extract the columns and make new data-frame
new_df <- data.frame(get_traffic_df$responses.timestamp,get_traffic_df$responses.camera_index,get_traffic_df$responses.camera_name,
get_traffic_df$responses.latitude,get_traffic_df$responses.longitude)

colnames(new_df) <- c("timestamp","camera_index","camera_name","latitude","longitude")

#convert the new df columns into JSON format
JSON_format <- toJSON(new_df)
JSON_format

#Write to a JSON file
write(JSON_format, "test.json")


