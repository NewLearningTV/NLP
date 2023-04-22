# 기사에 나온 내용은 여기서 나왔습니다
# https://www.cellntell.com/pcmag-reviews-apple-iphone-13-samsung-galaxy-s22/

# The information here is used purely for demonstration purpose
# Please refer above for the article content

library(tm)
library(wordcloud)

text <- "Dear Reader,
We are starting a new series of phone reviews published originally in PC Magazine to keep you and your customers informed and educated on the pros and cons of popular models.
This is the first in the series on the Apple iPhone and the Samsung Galaxy S22+.
Apple’s iPhone 13
Apple iPhone 13 is a battery life beast, with far greater longevity than previous mid-range smartphones. While we appreciate the greater pocketability of the iPhone 13 mini, unimpressive sales of the iPhone 12 mini taught us that most people prefer long battery life to a petite form factor. So even though other upgrades from the previous generation are nearly unnoticeable here, the battery boost is so profound that it’s definitely worth the premium over a standard-size iPhone 12. And if you’re upgrading from an earlier iPhone, you’ll find a lot of welcome enhancements in power and camera quality. That makes the iPhone 13 the best bet for most buyers, as well as the winner of our Editors’ Choice award.
The iPhone 13 looks almost identical to the iPhone 12. At 5.8 by 2.8 by 0.3 inches (HWD) and 6.1 ounces, it’s pretty much the exact same size as the iPhone 12, but a third of an ounce heavier. Because of slightly different side button positioning, some cases designed for the previous model work, and others don’t.
There’s one difference to note on the front, and one on the back. On the front, the 'notch' at the top for Face ID is slightly smaller—20% smaller, according to Apple. On the back, the two camera lenses are slightly larger, and staggered diagonally rather than stacked vertically.
There are five color options, including blue, pink, red, 'midnight' (a blue so dark it can read as black), and 'starlight' (a subtle off-white, like an eggshell).
Like the iPhone 12, the iPhone 13 has a gorgeous 6.1-inch, 2,532-by-1,170-pixel OLED display with a wide color gamut and Apple’s True Tone color management. Apple says typical brightness is now 800cd/m2 as compared with 625cd/m2 on the iPhone 12. I can’t see a difference when eyeballing it; we’ll rely on DisplayMate Labs’ testing to double-check that number when their results come out.
Samsung Galaxy S22+
Samsung’s Galaxy S22+ is a crowd-pleaser. It has reliable reception, a bright screen, solid cameras, and good battery life. None of this is surprising; Samsung’s Galaxy phones are the default choices for most Android users in the US, and certainly for existing Samsung device owners who want to upgrade. The S22+ is the middle child of the S22 lineup—it doesn’t have an S Pen like the Galaxy S22 Ultra and isn’t as compact as the S22. In other years, that could make it forgettable, but this time around the S22+ strikes the best balance between performance, value, and portability of the three. At the high end of the Android phone market in the US, the S22+ competes only with the Google Pixel 6 Pro. Google’s flagship is more affordable and has better cameras, but the S22+ offers a stronger processor and cellular radio.
The Samsung Galaxy S22+ blends top-notch connectivity and performance with the best mix of features and size for the price, making it the flagship Android phone to beat which earned it the Editors’ Choice award."

topic_text <- Corpus(VectorSource(text))
topic_text <- tm_map(topic_text, removePunctuation)
topic_text <- tm_map(topic_text, removeNumbers)
topic_text <- tm_map(topic_text, content_transformer(tolower))
topic_text <- tm_map(topic_text, removeWords, stopwords("english"))

tdm <- TermDocumentMatrix(topic_text)
m <- as.matrix(tdm)
word_freq <- sort(rowSums(m), decreasing = TRUE)

wordcloud(words = names(word_freq), freq = word_freq, min.freq = 1,
          max.words = 100, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))