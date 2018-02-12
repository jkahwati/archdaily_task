require 'gemarticle'
require 'json'
continue = true
while(continue)
	p '_____________________________________________________'
	puts "Selecciona una opción:
	  1: Scenario 1
	  2: Scenario 2
	  3: Scenario 3
	  4: Scenario 4
	  5: Agregar un nuevo scenario (json)
	  6: Pruebas automáticas (rspec)
	  7: Salir"
	 p '_____________________________________________________'

	STDOUT.flush  
	option = gets.chomp 
		case option.to_i
		when 1..4 then
			file = File.read("scenario#{option}.json")
			data_hash = JSON.parse(file)
			article = Article.new
			article.recomended(data_hash)
		when 5 then
			p "Introduzca json: "
			new_scenario = gets.chomp 
			data_hash = JSON.parse(new_scenario)
			article = Article.new
			article.recomended(data_hash)
		when 6 then
			system('bundle exec rspec')
		else
			continue=false
		end
end