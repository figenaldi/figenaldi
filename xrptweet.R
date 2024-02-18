install.packages("rtweet")
install.packages("twitteR")
install.packages("tidytext")
install.packages("tidyverse")
install.packages("readr")
library("readr")
library(tidyverse)
library(rtweet)
library(twitteR)
library(tidytext)



if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

remotes::install_github("ropensci/rtweet")


rtweet_app()

api_key <- "xRU97JfuWtbb6wDs7g2vvMWzG"
api_secret_key <- "jBdGziSSmH3HFjptBWiRNFbkDUutNHlO8k8VMRMp4NQ4kMwKsr"

# tarayiciyla web dogrulamasi yapiyoruz.
token <- create_token(
  app = "emotionalchangofmds",
  consumer_key = api_key,
  consumer_secret = api_secret_key)
auth_get()

# xrp kelimesini iceren, retweetlerin dahil olmadigi son 100000 adet tweeti cagiriyoruz.
xrp <- search_tweets("xrp", n = 100000, include_rts = FALSE)
View(xrp)

# verilerden sectigimiz sutunlari dataframe haline getiriyoruz
df <- data.frame(xrp$text)
View(df)

# dataframemizi disari istedigimiz formda aktariyoruz.
write.csv(df, "xrptweet.csv")


# burada filtreleme mekanizmasina retweet, quote ve replyleri istemedigimizi soyledik.
ukraine <- search_tweets("StandWithUkraine-filter:retweets -filter:quote -filter:replies", n = 100000)
View(ukraine)

tail(ukraine)
head(ukraine)

# bu fonksiyonla bolgesel olarak trendlerin dokumunu alabiliyoruz. ulke seklinde kullanılıyor.
get_trends("Turkey")
get_trends("USA")

