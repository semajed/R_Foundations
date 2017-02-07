library("RDSTK")
library("readr")
library("twitteR")
library("qdap")
library("syuzhet")
library("ggplot2")

#### Basic Text Analysis ####
## packages used: readr, syuzhet ##

??syuzhet
??readr
??twitteR

gandhi_speech = read_file("assets/gandhi_speech2.txt")
View(gandhi_speech)





### polarity and sentiment ###
?get_nrc_sentiment
g_scores = get_nrc_sentiment(gandhi_speech)
class(g_scores)
g_polarity = g_scores[1,9:10]
g_polarity
g_sentiment = g_scores[1,1:8]
g_sentiment















## visualize polarity
class(g_polarity)

g_polarity = data.matrix(g_polarity, rownames.force = TRUE)
barplot(g_polarity)













## visualize sentiment
class(g_sentiment)
g_sentiment = data.matrix(g_sentiment, rownames.force = TRUE)
barplot(g_sentiment)
















### Break it down by sentence ###
g_speech_sen = get_sentences(gandhi_speech)
g_speech_sen
sentiment_vector = get_sentiment(g_speech_sen, method="syuzhet")
sentiment_vector
summary(sentiment_vector)
boxplot(sentiment_vector)











## What was the most positive sentence in the whole paragraph?
max(sentiment_vector)
sentence_sentiment = data.frame(g_speech_sen, sentiment_vector)
View(sentence_sentiment)

which.max(sentence_sentiment$sentiment_vector)


## we now have an index, what can we do with this?
most_positive = sentence_sentiment[which.max(sentence_sentiment$sentiment_vector),]
## don't forget the comma!















#### WORD CLOUD MAGIC ####

library("devtools")
library("ggplot2")
library("RColorBrewer")
library("tm")
library("SnowballC")
library("wordcloud")

?wordcloud

wordcloud(gandhi_speech,colors=c("blue","green"))
















#### TWITTER ####
??twitter
## keep your API info secret
twitter_auth = read.csv("../twitter_auth.csv")
setup_twitter_oauth(twitter_auth$cons_key, twitter_auth$cons_secret, twitter_auth$acc_token, twitter_auth$acc_secret)















caferio = searchTwitter("#caferio", n=5)
head(caferio)
class(caferio)

caferio = strip_retweets(caferio)

## change to dataframe
caferio = twListToDF(caferio)
head(caferio)
class(caferio)

## extract hashtags
caferio_hashtags = ex_hash(caferio$text)
head(caferio_hashtags)

## cleaning twitter
cleaned_tweets = rm_hash(caferio$text)
cleaned_tweets = as.matrix(cleaned_tweets)

cleaned_tweets= rm_tag(cleaned_tweets)
cleaned_tweets = as.matrix(cleaned_tweets)

cleaned_tweets = rm_url(cleaned_tweets)
cleaned_tweets = as.matrix(cleaned_tweets)

cleaned_tweets

cafe_rio_sentiment = get_sentiment(cleaned_tweets)
caferio_analysis = data.frame(cleaned_tweets, cafe_rio_sentiment)

## other things you can do with the Twitter package
hans_olsen = getUser("975Hans")
hans_olsen$description
hans_olsen$getFollowersCount()
hans_olsen$getFriends(n=5)
hans_olsen$getFavorites(n=5)

potus_timeline = userTimeline("POTUS")

?getTrends
avail_trends = availableTrendLocations()
closestTrendLocations(40.2338, -111.6585)
slc_trends = getTrends(2487610)
head(slc_trends)


## getting device type ##
byufootball_tweets = searchTwitter('#byufootball',n=20)
df_byufb = twListToDF(byufootball_tweets)

tweet_sources = df_byufb$statusSource
tweet_sources = gsub("</a>","", tweet_sources)
tweet_sources = strsplit(tweet_sources,">")
tweet_sources = sapply(tweet_sources, function(x) ifelse(length(x) > 1, x[2], x[1]))

source_table = table(tweet_sources)

pie(source_table[source_table > 1])





