require "./article"
require 'json'

file = File.read('articles_recomendation.json')
data_hash = JSON.parse(file)

article = Article.new

article.recomended(data_hash)





