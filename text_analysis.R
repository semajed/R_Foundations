## author: James Dayhuff, Winter 2017 ##
## course: Data Analytics in R ##


## LOAD THESE PACKAGES
## DOWNLOAD "ghandi_speech2.txt"

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


gandhi_speech = read_file("assets/gandhi_speech2.txt")
View(gandhi_speech)





### polarity and sentiment ###
?get_nrc_sentiment

g_scores = get_nrc_sentiment(gandhi_speech)
g_scores
class(g_scores)

g_polarity = g_scores[1,9:10]
g_polarity
g_sentiment = g_scores[1,1:8]
g_sentiment















## visualize polarity
class(g_polarity)
plot(g_polarity)
## what's happening here?

g_polarity = data.matrix(g_polarity, rownames.force = TRUE)

barplot(g_polarity)














## visualize sentiment
class(g_sentiment)
plot(g_sentiment)

g_sentiment = data.matrix(g_sentiment, rownames.force = TRUE)
barplot(g_sentiment)
















### Break it down by sentence ###
??get_sentences
g_speech_sen = get_sentences(gandhi_speech)
g_speech_sen

??get_sentiment
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
library("twitteR")
??twitteR
## keep your API info secret
twitter_auth = read.csv("../twitter_auth.csv")

setup_twitter_oauth(twitter_auth$cons_key, twitter_auth$cons_secret, twitter_auth$acc_token, twitter_auth$acc_secret)

## search twitter
## clean the tweets












?searchTwitter
chickfila = searchTwitter("#ChickfilA", n=6)
head(chickfila)
class(chickfila)






?strip_retweets
chickfila = strip_retweets(chickfila)

## change to dataframe
?twListToDF
chickfila = twListToDF(chickfila)
class(chickfila)
View(chickfila)


## extract hashtags
?ex_hash
chickfila_hashtags = ex_hash(chickfila$text)
head(chickfila_hashtags)







## cleaning twitter
cleaned_tweets = rm_hash(chickfila$text)
class(cleaned_tweets)
cleaned_tweets = as.matrix(cleaned_tweets)
?rm_tag
cleaned_tweets= rm_tag(cleaned_tweets)
cleaned_tweets = as.matrix(cleaned_tweets)

cleaned_tweets = rm_url(cleaned_tweets)
cleaned_tweets = as.matrix(cleaned_tweets)

cleaned_tweets
cleaned_tweets = cleaned_tweets[-2,]

?get_sentiment
chickfila_sentiment = get_sentiment(cleaned_tweets)
chickfila_sentiment
summary(chickfila_sentiment)
chickfila_analysis = data.frame(cleaned_tweets, chickfila_sentiment)
View(chickfila_analysis)






## other things you can do with the Twitter package
?getUser
chickfila_user = getUser("chickfila")
chickfila_user
chickfila_user$description
chickfila_user$getFollowersCount()
chickfila_user$getFriends(n=5)
chickfila_user$getFavorites(n=5)


??userTimeline
potus_timeline = userTimeline("POTUS")

potus_timeline








## get trends

?getTrends
avail_trends = availableTrendLocations()
avail_trends

closestTrendLocations(40.2338, -111.6585)

slc_trends = getTrends(2487610)
head(slc_trends)
View(slc_trends)













## getting device type ##
football_tweets = searchTwitter('#football',n=20)
df_fb = twListToDF(football_tweets)
View(df_fb)

tweet_sources = df_fb$statusSource
tweet_sources = gsub("</a>","", tweet_sources)
tweet_sources = strsplit(tweet_sources,">")
tweet_sources = sapply(tweet_sources, function(x) ifelse(length(x) > 1, x[2], x[1]))

source_table = table(tweet_sources)

pie(source_table[source_table > 1])





