require 'active_support/all'
require 'pry'

class Article

	def initialize
		@final_articles = []
	end

	def recomended (articles_recomendation, index=0)
		index = index-3 if index == 3
		articles_array = articles_recomendation.to_a
			if @final_articles.count < 4 and articles_array.present?
				@final_articles << articles_array[index][1][0] if articles_array[index].present? and articles_array[index][1][0].present? and !(@final_articles.include? articles_array[index][1][0])
				articles_array[index][1].delete_at(0) if articles_array[index]
				articles_array = articles_array.select{|element| element[1].present?}
				recomended(articles_array,index+1)
			else
				p @final_articles.map{|art| art['token'].to_i}
			end
	end

end


# require 'active_support/all'

# class Article

# 	def recomended (articles_recomendation)
# 		aux_hash = []
# 		articles_array = articles_recomendation.to_a #Convert to array
# 		articles_array.each do |article| #Iterate between (Logs,Content,Myad)
# 			aux = []
# 		  article[1].each {|art|  aux << art['token'] if art['token'].present? }
# 		  aux_hash << aux
# 		end
# 		final_recomended_articles = []
# 		while (final_recomended_articles.count < 4 and aux_hash.present?  ) do
# 			aux_hash.each do |algh_results|  
# 				if final_recomended_articles.count < 4
# 					final_recomended_articles << algh_results[0].to_i if !final_recomended_articles.include? algh_results[0].to_i and algh_results[0].present?
# 					algh_results.delete_at(0)
# 					aux_hash = aux_hash.select{|element| element.present?}
# 				else
# 					aux_hash.clear
# 				end
# 			end
# 		end
# 		p final_recomended_articles
# 	end

# end