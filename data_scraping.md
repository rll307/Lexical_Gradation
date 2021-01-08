# Data Scraping: Lexical graduation in the word 'mito' in YouTube Users Comments
 

[Rodrigo Esteves de Lima Lopes](mailto:rll307@gmail.com)

[Carolina Palma de Sousa Arruda](mailto:carolpalma203@gmail.com)

# Introduction

This script was developed for the analysis of Portuguese. We hope it helps colleagues in the LC area and popularize the use of R. It is part of our research project developed with CNPQ. Please drop us a line if you have any doubts or need any help.

## Purpose of this repository

This repository brings the scripts used for lexical analysis of Brazilian Portuguese YouTube comments we wrote for our paper:

> Lima-Lopes, R. E. de and Arruda, C. P. S. (2020) Strategies for Gradation in YouTube comments. (under review)

This script is specifically about data scraping.

# Packages

We are going to use the [tuber](https://github.com/soodoku/tuber) package for data scraping (YouTube). In order to scrape data from [YouTube](https://www.youtube.com/) you will probably need a Goggle [developer account](https://developers.google.com/ "Google developer account"). It has more privileges and allows you to scrape all data necessary. However, dealing with any API is not a bed of roses and some configurations are not that obvious. [This tutorial](https://www.youtube.com/watch?v=3H-1RRsrBfw "API tutorial") might bring a bit of help, but be prepared for some try and error.

# Getting the comments

## Setting the environment

The chunk bellow shows how to setup the environment to log on [YouTube's API](https://developers.google.com/) and scrape all comments.


```r
library(tuber)
app_id <- "your app_if"
app_secret <- "your app_secret"
API_KEY <- "your app_secret"
yt_oauth(app_id, app_secret,token = "")
```

Important to observe that each of these variables will be given to you as you configure your Goggle [developer account](https://developers.google.com/ "Google developer account").

## Downloading the data

Two commands will be necessary to download the comments:


```r
statistics <- get_stats(video_id = "YOWJSpPcCqc")
comments <- get_all_comments(video_id="YOWJSpPcCqc")
```

-   `get_stats` will download general data regarding the videos

-   `get_all_comments` will download the video comments and save them in a data frame. Some other information is also made available, such as *author URL*, *ID*, *Display name* and many others. Please note that `YOWJSpPcCqc` is the actual ID for the video we studied.
