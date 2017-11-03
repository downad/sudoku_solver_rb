# Strategie Manuelles eintragen

	def manuelles_eintragen
		gemachte_zuege = 1
		puts "####################################################\n#####\n#####"
		puts "##### Manuelles lösen"
		puts "#####\n#####\n####################################################"
 	
		make_html_output
		coordinate = ""	
		number = ""
		input_char = ""
		input_string = ""
		allowed_char_for_break = Array.new
		allowed_char_for_break = ["h", "q", "s", "x"] # "l" nicht! - sonst kommt man in Koordinate! # Wichtig Text anpassen!
		allowed_char = Array.new
		allowed_char = allowed_char_for_break.clone #x["h", "q", "s", "x"] 
		allowed_char << "l"
		puts "allowed_char - #{allowed_char}"
		# loop für manuelle Eingabe
		# break if solved oder "eingabe" = q  
		loop do
			break if @solver.is_grid_solved == true
			# loop - Was soll gemacht werden? h - help, q - ende, s - set, d - delete (not implementiert)
			# break if solved oder "eingabe" = q  
			loop do
				break if @solver.is_grid_solved == true
				# print game 
				puts @solver.print_grid
				puts "Noch #{@solver.count_unsolved_cell} Zelle müssen gelöst werden"
				puts "Was soll gemacht werden? \n s- setze Koordinate \n l- teste Logic-Module \n q / x - Quit Programm sofort beenden \n h- help Text"
				input_string = gets.chomp
				input_char = input_string[0]
				
				# Teste Logic-Module	
				do_logic(input_string) if input_char == "l"
			
				break if allowed_char_for_break.include?(input_char) == true
				if  allowed_char.include?(input_char) == false
					puts " #{input_char} -> Falsche Eingabe, erlaubt ist nur #{allowed_char_for_break}" 
				end
			end # Ende loop Was soll gemacht werden
			
			error_log = [false, false]
			# loop koordinate ermitteln
			loop do
				break if coordinate[0] == "x" or ["x", "q"].include?(input_char) == true
				break if @solver.is_grid_solved == true
				puts "Bitte gib die Koordienaten ein. (q / x für Ende, h für Hilfe)"
				coordinate = gets.chomp
				if coordinate[0] == "h"
					puts @solver.print_grid 	
					puts "Koordinaten als Reihe / Spalte -> z.B. Reihe 3 Spalte 2 = 3/2"
					puts "Bitte gib die Koordienaten ein. (q / x für Ende, h für Hilfe)"
				end
				# überprüfe die Koordinate
				if @solver.is_coordinate_allowed(coordinate) == false and ["h", "x"].include?(coordinate[0]) == false
					puts @solver.print_grid 	
					puts "Die angegebene Kooridianten sind nicht erlaubt."
				else
					puts "Die Kooridianten #{coordinate} sind erlaubt."
					# überprüfe die Koordinate
					if @solver.is_cell_unsolved(coordinate) == false and ["h", "x"].include?(coordinate[0]) == false
						puts @solver.print_grid 	
						puts "Diese Zelle hat schon eine Lösung! \n"
					else
						break if 1 == 1 
					end
				end
			end # loop koordinate
			if coordinate == "x"
				puts "Vielen Dank"
				puts @solver.get_solved_by_text_of_cells("sortiert")
			end
			break if ["x", "q"].include?(input_char) == true
			break if ["x", "q"].include?(coordinate[0]) == true 
			break if ["x", "q"].include?(number[0]) == true

			#error_log = [false, false]
			puts "Welche Zahl soll in die Zelle(#{coordinate}) eingetragen werden?"
			loop do
				break if ["x", "q"].include?(number[0]) == true
				#break if error_log[0]== true 
				break if @solver.is_grid_solved == true
				number = gets.chomp
				#error_log = @solver.is_value_allowed(number.to_i)
				if @solver.is_value_allowed(number.to_i) == false 
					puts "Die Eingegeben Zahl [#{number.to_i}]ist nicht erlaubt. In der Reihe, Spalte oder dem Feld ist sie schon gesetzt."
				else
					break if 1 == 1 
				end 
			end
			value = number.to_i
			puts "Setze an die Koordianten #{coordinate} - die Zahl #{number}"
			error_log = @solver.set_cell_value(coordinate, value, "manuelles Eintragen") 

			if error_log[0]== false 
				puts "#{error_log[1]} "
			else
				zug_count = @zuege.size
				puts "#{zug_count}-> An der Koordinate #{coordinate} wurde die Zahl #{number} erfolgreich einzufügen"
				@zuege << "set_coordinate[#{zug_count}] =  [#{coordinate}, #{number}]" 
				puts @solver.print_grid 
				make_html_output
			end 
	
			# print game 
			break if ["x", "q"].include?(input_char) == true
			break if ["x", "q"].include?(coordinate[0]) == true 
			break if ["x", "q"].include?(number[0]) == true
			break if @solver.is_grid_solved == true
		end # loop

		return "Fertig mit der manuellen Eingabe"
	end # def		


	def do_logic(input_string)
		input_string = ""
		allowed_char_for_break = ["q", "x", "ns", "hs", "np", "hp", "lbi", "xwing", "all"] # Wichtig Text anpassen!
		# loop für manuelle Eingabe
		# break if solved oder "eingabe" = q  

		loop do
			puts "mögliche Logic-Module "
			puts " ns - naked single"
			puts " hs - hidden single"
			puts " np - naked pair"
			puts " hp - hidden pair"
			puts " lbi - line block interaction"
			puts " xwing - X Wing"
			puts " all - nutze alle Logic-Module "
			puts " q / x - Quit Programm sofort beenden"
			input_string = gets.chomp
			break if allowed_char_for_break.include?(input_string) == true
			if  allowed_char_for_break.include?(input_string) == false
				puts " #{input_string} -> Falsche Eingabe, erlaubt ist nur #{allowed_char_for_break}" 
			end
		end # Ende loop Was soll gemacht werden

		# ermittle alle leeren Zellen
		empty_cells = Array.new
		empty_cells = @solver.get_coordinates_of_unsolved_cell

		empty_cells.each{ |coordinate|
			puts "Zelle(#{coordinate})" #if text[0] == true
			 
			# Logic-Modul Naked Single
			if ["ns", "all"].include?(input_string) == true
				puts "Verwende Logic-Modul 1 'Naked Single'"
				text = @solver.naked_single(coordinate)
				puts "ns - Zelle(#{coordinate}) mit der Zahl #{text[2]}" if text[0] == true
			end
			# Logic-Modul Hidden Single
			if ["hs", "all"].include?(input_string) == true
				puts "Verwende Logic-Modul 2 'Hidden Single'"
				text = @solver.hidden_single(coordinate)
				puts "hs - Zelle(#{coordinate}) mit der Zahl #{text[2]}" if text[0] == true
			end
			# Logic-Modul naked pair
			if ["np", "all"].include?(input_string) == true
				puts "Verwende Logic-Modul 3 'Naked Pair'"
				text = @solver.naked_pair(coordinate)
				puts "np - Zelle(#{coordinate}) mit der Zahl #{text[2]}" if text[0] == true
			end
			# Logic-Modul hidden pair
			if ["hp", "all"].include?(input_string) == true
				puts "Verwende Logic-Modul 4 'Hidden Pair'"
				text = @solver.hidden_pair(coordinate)
				puts "hp - Zelle(#{coordinate}) mit der Zahl #{text[2]}" if text[0] == true
			end
			# Line Block Interaktion
			if ["lbi", "all"].include?(input_string) == true
				puts "Verwende Logic-Modul 5 'Line Block Interaction'"
				text = @solver.line_block_interaction(coordinate)
				puts "lbi - Zelle(#{coordinate}) mit der Zahl #{text[2]}" if text[0] == true
			end
			# Fish - X-Wing
			if ["xwing"].include?(input_string) == true
				puts "Verwende Logic-Modul 5 'Line Block Interaction'"
				text = @solver.xwing(coordinate)
				puts "xwing - Zelle(#{coordinate}) mit der Zahl #{text[2]}" if text[0] == true
			end
		}
		puts "Ende mit Logic-Module #{input_string}"
		make_html_output
	end	


 	def make_html_output
		# erzeuge ein html
		html_help = true
		cells = @solver.get_sudoku_cells(html_help)
		htmlout = out_to_html(cells)
		File.write(@htmlout_file, htmlout)
	end
#end
