#Text analysis and visualisation with R
#http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know
#incomplete - more to add..... (4. Making sense of relational and textual data)

library("tm") # for text mining
library("SnowballC") # for text stemming
library("wordcloud")
library("RColorBrewer")

# Read the text file
#filePath <- "WordCloud.txt" # 
#text <- readLines(filePath)

# Read the text file from internet
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)


# Load the data as a corpus and save a copy as 'input'
input <- Corpus(VectorSource(text))
docs = input


dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(words = names(v), freq = v)
nrow(d) # how many 'words'
head(d, 10) # look at top 10

#How many 'words' are there?
tail(d,10)
# or look at all the words with
# d$word
# generate the raw word cloud, OK here because it's 'reasonably' tidy text
# up to you if you want to try this with e.g. tweets
set.seed(1234) # so that the cloud is reproducible, optional
wordcloud(words = d$words, freq = d$freq, min.freq = 1,
max.words = 200, random.order = FALSE, rot.per = 0.35,
colors = brewer.pal(8, "Dark2"))

#What's the difference between the two parameters?
set.seed(1234) # reproducible, optional
wordcloud(words = d$words, freq = d$freq, min.freq = 1,
max.words = 200, random.order = FALSE, rot.per = 0.35,
colors = brewer.pal(8, "Dark2"))


stopwords("english")
stopwords("french") # c'est la vie...
stopwords("romanian") # why not...
stopwords("swahili") # no... boo
docs <- tm_map(docs, removeWords, stopwords("english"))
# this is destructive, you may need to start again or use the copy 'input'
# and process again
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(words = names(v), freq=v)
nrow(d)
head(d, 10)
# and display again, 'the' should be gone
set.seed(1234)
wordcloud(words = d$words, freq = d$freq, min.freq = 1,
max.words=200, random.order=FALSE, rot.per=0.35,
colors=brewer.pal(8, "Dark2"))

stemCompletion(c("visualis","techniqu","identifi"), d$words)
stemCompletion(c("visualis","techniqu","identifi"), d$words, type = "prevalent")
stemCompletion(c("visualis","techniqu","identifi"), d$words, type = "random")

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
nrow(d)
head(d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
max.words=200, random.order=FALSE, rot.per=0.35,
colors=brewer.pal(8, "Dark2"))
# stemCompletion(docs, d$words)


docs <- tm_map(input, stemDocument, language = "english") # stemming first,
input is original
# docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
nrow(d)
head(d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
max.words=200, random.order=FALSE, rot.per=0.35,
colors=brewer.pal(8, "Dark2"))
# Remove common English stopwords (e.g. 'the')
docs <- tm_map(docs, removeWords, stopwords("english"))
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)



