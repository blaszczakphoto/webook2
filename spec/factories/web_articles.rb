FactoryGirl.define do
  factory :web_article do
    content "<p>Content ppp</p>"
    title "Another book"
    url "http://www.google.com/"
    image_urls "http://rs287.pbsrc.com/albums/ll155/Bastepus/DSC_0366.jpg?w=280&h=210&fit=crop"
    author "Mariusz"
    word_count "123"
    date_published "12-12-1991"
    book
  end
end
