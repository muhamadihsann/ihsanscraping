# Title     : Twitter API Scraping
# Objective : To Scrap Twitter with API

# Step 1: Install and load rtweet package 

#install.packages("rtweet")
#library(rtweet)

#install.packages("devtools")
#library(devtools)
#install_github("mkearney/rtweet")
library(rtweet)

# Step 2: API Authorization 

# Find out how to get consumer_key and consumer_secret here: 
# https://www.nurandi.id/blog/twitter-authentication-dengan-r/
# https://www.nurandi.id/blog/rtweet-crawling-data-twitter-menggunakan-r/

# Option 1 - not working 
# token <- create_token(
#   consumer_key = "r8j6JhG8nhoRWW2oib0N5P1sx",
#   consumer_secret = "r8QXIBWIhhz30KpeRBEW9NVKHKBBOvSvZLfS8pk0bKr10fNzxC")

# With access token / secret
token <- create_token(
  consumer_key = "bvHqRuvXV7F9Frb14VITa6jLN",
  consumer_secret = "el3tD3OEe1XJa2Az4K2u8eFrsI98SCMRtvfkeJnN1AACpsdaUO",
  access_token = "242719073-RUJR8ZMgbj6rWB9MVAA7gTiqCEuqcjgQI7wPArg0",
  access_secret = "XtTFr10n0oLqE0fgmrANYgIrB1XmFj9TdBNbvW779kYCN")

# Step 3: Crawling Data Twitter 

# Define your twitter username 
my_username='_muhamadihsann'

# Setelah proses otentikasi berhasil, kita siap untuk “menambang” data (crawling) dari Twitter. Untuk kepeluan ini, rtweet mengemas berbagai fungsi yang cukup lengkap, di antaranya:
#   
#   search_tweets() : mencari tweet dengan kata kunci tertentu
# lookup_users() : menampilkan data detail dari satu atau lebih user(s)
# get_timelines() : menampilkan status/tweet yang pernah diposting oleh user tertentu aka timeline
# get_followers() : menampilkan list followers dari user tertentu
# get_friends() : menampilkan list fiends/followings atau yang di-follow user tentu
# dan masih banyak yang lain seperti untuk menampilkan retweet, siapa yang me-retweet, mendapatkan list favorite, menampilkan trending topics, cleansing tweet, dan juga ekspor data ke file csv.

# find 1000 tweets with keywords: "kota jakarta"
tweet <- search_tweets(q = "#SDMUnggul", n = 1000)

# to know the column names of tweet 
colnames(tweet)
dim(tweet)

# let's take a look at three columns
SDMUnggul <- tweet[,c("created_at", "screen_name", "text")]
write.csv2(SDMUnggul, "sdmunggul1.csv")