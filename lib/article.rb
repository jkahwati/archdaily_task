require 'active_support/all'

class Article

	def recomended (articles_recomendation)
		aux_hash = []
		articles_array = articles_recomendation.to_a #Convert to array
		articles_array.each do |article| #Iterate between (Logs,Content,Myad)
			aux = []
		  article[1].each {|art|  aux << art['token'] if art['token'].present? }
		  aux_hash << aux
		end
		final_recomended_articles = []
		while (final_recomended_articles.count < 4 and aux_hash.present?  ) do
			aux_hash.each do |algh_results|  
				if final_recomended_articles.count < 4
					final_recomended_articles << algh_results[0].to_i if !final_recomended_articles.include? algh_results[0] and algh_results[0].present?
					algh_results.delete_at(0)
					aux_hash = aux_hash.select{|element| element.present?}
				else
					aux_hash.clear
				end
			end
		end
		p final_recomended_articles
	end

end