class Suduku9x9

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # #
# # # # #					LOGIC-MODUL Nr.1
# # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


=begin
## Name 
			naked_single LOGIC-MODUL Nr.1

## Version 
			V1.0 vom 16.11.2016 15:20 Uhr
	
## Was macht die Methode?
	Untersucht die aktuelle Zelle  
	Gibt es nur noch eine Zahl, dann ist es ein Naked Single 

## access (Methode)

## Übergabe-Variable - Welche Werte werden übergeben?  
	string coordinate 
  
## RETURN - Was liefert die Methode zurück?
	array[0] 						-> false - kein Hidden Singel / true - ein Hidden Single
  array[1]						-> method_name - gefunden in Reihe, Spalte oder Feld
  array[2]						-> Zahl die gefunden wurde
  array[3]						-> Koordinate

=end
	def naked_single(coordinate)
		method_name = set_method("naked_single")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		solved_by = @myMethod[method_name].solved_by

	#	debug_YesNo = true if coordiante = "2/5"

		naked_single = [false, method_name, 0, "0/0"]
		puts "#{method_name} - #{coordinate}" if debug_YesNo == true	
		candidates = get_candidates(coordinate)
		count = 0
		value = 0
		set_single = false

		# finde ein Naked Single
		candidates.each_key { |key|
			if candidates[key] == 1
					count += 1
					value = key
			end
		}
		# ist es ein Full House, also die letzte Zahl in einer Unit?
		["row", "col", "block"].each { |unit|
			count_values = 0
			unsolved_only = false
	 		get_values_in_unit(get_coordinates(unit, coordinate, unsolved_only)).each { |key, value| count_values += 1 if value == 1}  
			if count_values == 8
				solved_by = "Single - Full House"
				naked_single = set_cell_value(coordinate, value, solved_by)
				naked_single[1] = "#{method_name} - Zelle (#{coordinate}) \nNaked Single = #{value}"
				set_single = true
			end
		}
		if count == 1 and set_single == false
			puts "#{method_name} - Naked Single gefunden Zell(#{coordinate}) Zahl = #{value}"  if debug_YesNo == true
			naked_single = set_cell_value(coordinate, value, solved_by)
			naked_single[1] = "#{method_name} - Zelle (#{coordinate}) \nNaked Single = #{value}"
		end
		puts naked_single if debug_YesNo == true
		return naked_single
	end

end
