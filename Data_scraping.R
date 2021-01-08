
# Setting the environment -------------------------------------------------

library(tuber)
app_id <- "your app_if"
app_secret <- "your app_secret"
API_KEY <- "your app_secret"
yt_oauth(app_id, app_secret,token = "")


# Downloading statistics and comments -------------------------------------

statistics <- get_stats(video_id = "YOWJSpPcCqc")
comments <- get_all_comments(video_id="YOWJSpPcCqc")

# "YOWJSpPcCqc" is the actual video ID
