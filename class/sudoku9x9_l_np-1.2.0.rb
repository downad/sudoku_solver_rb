class Suduku9x9

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # #
# # # # #					LOGIC-MODUL Nr.3
# # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


=begin
## Name 
			naked_pair LOGIC-MODUL Nr.3

## Version 
			V1.0 vom 16.11.2016 15:20 Uhr
	
## Was macht die Methode?
			Ist die Zelle leer und ungelöst?
			Ist in der Zelle ein Paar? 
			Durchlaufe Reihe / Spalte / Feld und suche ein Paar
			Ist es dasselbe Paar?
				Ja, dann sind alle Paar - Zahlen in den anderen Zelle der Reihe / Splate / Feld verboten 

## access (Methode)

## Übergabe-Variable - Welche Werte werden übergeben?  
		string coordinate 

## RETURN - Was liefert die Methode zurück?
	array[0] 						-> false - kein Hidden Singel / true - ein Hidden Single
  array[1]						-> method_name - gefunden in Reihe, Spalte oder Feld
  array[2]						-> Zahl die gefunden wurde
  array[3]						-> Koordinate

=end
	def naked_pair(coordinate)
		method_name = set_method("naked_pair")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		modified_by = @myMethod[method_name].modified_by

		returnvalue =  [false, "#{method_name} ", 0, "0/0"]
		is_pair = Array.new
		pair_candidate = Hash.new
		pair_coordinate = Array.new
		pair_coordinate = []
		maybe_pair = Array.new
		returnnumber = Array.new
		returncoordiante = Array.new
		
		# Ist die Zelle ungelöst? 
		if is_cell_unsolved(coordinate) == true 
			
			# Gibt es ein Paar?  is_pair == 2, 
			is_pair = count_candidates_in_cell(coordinate)[0]
			puts "#{method_name} - Zelle(#{coordinate}): mögliche Lösungen = #{is_pair}"  if debug_YesNo == true	
		
			# Es gibt ein Paar
			if is_pair == 2 
				# Fülle den Hash mit Coordinaten und candidates 
				pair_candidate = count_candidates_in_cell(coordinate)[1].clone
#				# schreibe die Coordinate in den Array pair_coordinate = Array.new
#				pair_coordinate << coordinate

				["row", "col", "block"].each { |unit_by_name|
					count_values = 0
					pair_coordinate = [coordinate]
					unsolved_only = true
					# hole alle ungelösten Zell-Koordianten der Unit und durchlaufe sie

			 		get_coordinates(unit_by_name, coordinate, unsolved_only).each { |s_coordinate|
						# Test auf Paar
						maybe_pair = Array.new
						maybe_pair = count_candidates_in_cell(s_coordinate)
	
						if maybe_pair[0] == 2 and coordinate != s_coordinate
							# vergleiche ob die Zelle die selben Candidates hat
							# schreibe die Zell-Koordinate in pair_coordinate
							pair_coordinate << s_coordinate if maybe_pair[1] == pair_candidate
							if pair_coordinate.size == 2
								puts "#{method_name} - unit_by_name  #{unit_by_name} " if debug_YesNo == true
								puts "treffer #{method_name} - pair_coordinate  #{pair_coordinate} " if debug_YesNo == 	true
								delete_subset_in_unit(pair_candidate, pair_coordinate, unit_by_name, modified_by)
							end
						end	
					}
				}
			end	
		end
		return returnvalue
	end



end




