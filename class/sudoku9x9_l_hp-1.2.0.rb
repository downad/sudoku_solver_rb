class Suduku9x9

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # #
# # # # #					LOGIC-MODUL Nr.4
# # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


=begin
## Name 
			hidden_pair LOGIC-MODUL Nr.4

## Version 
			V1.2 vom 27.11.2016 15:20 Uhr
	
## Was macht die Methode?
 	Untersuche ausgehend von der aktuelle Zelle die Reihe, spalte oder ds Feld nach einem Hidden Pair
			Ein Hidden Pair besteht dann, wenn ein einem Bereich/section die Parung zweimal vorkommt

## access (Methode)

## Übergabe-Variable - Welche Werte werden übergeben?  
		string coordinate 
  
## RETURN - Was liefert die Methode zurück?
	array[0] 						-> false - kein Hidden Pair / true - ein Hidden Pair
  array[1]						-> method_name - gefunden in Reihe, Spalte oder Feld
  array[2]						-> Zahl die gefunden wurde
  array[3]						-> Koordinate

=end
  def hidden_pair(coordinate)
		method_name = set_method("hidden_pair")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		modified_by = @myMethod[method_name].modified_by

		hidden_pair = Array.new
		hidden_pair[0] = false
		hidden_pair[1] = ""
		hidden_pair[2] = Array.new
		hidden_pair[2] = ["0"]
		hidden_pair[3] = Array.new
		hidden_pair[3] = ["0/0"]
			
		#debug_YesNo = true
		puts "#{method_name} - coordinate #{coordinate} " if debug_YesNo == true
		puts "#{method_name} - is_cell_unsolved(coordinate) #{is_cell_unsolved(coordinate)} " if debug_YesNo == true
		
		# Ist die Zelle ungelöst?
		if is_cell_unsolved(coordinate) == true 
			# Sind in der Zelle mehr als 2 mögliche Zahlen?
			# Bei 2 Zahlen kann es maximal ein Naked Pair sein.
			# Bei 1 Zahl ist es ein Naked Single  
			if count_candidates_in_cell(coordinate)[0] > 2
				puts "#{method_name} - coordinate #{coordinate} " if debug_YesNo == true
				puts "#{method_name} - mehr als 2 Kandidaten #{count_candidates_in_cell(coordinate)[0]} " if debug_YesNo == true
				puts "#{method_name} - Kandidaten #{count_candidates_in_cell(coordinate)[1]} " if debug_YesNo == true
				puts "#{method_name} - rufe find_hidden_pair auf. " if debug_YesNo == true
				hidden_pair = find_hidden_pair(coordinate)
				puts "#{method_name} - find_hidden_pair liefert: #{hidden_pair} " if debug_YesNo == true
				
			end
		end
		return hidden_pair
	end		


 def find_hidden_pair(coordinate)
		method_name = set_method("find_hidden_pair")
		debug_YesNo = @myMethod[method_name].debug_YesNo

		hidden_pair =  [false, false, [], []]
	
		# Loop alle unit [row, col, block]
		["row", "col", "block"].each { |unit_by_name|
			# je Unit addiere alle Candidats
			candidates_in_unit = Hash.new			
			a_coordinate = Array.new
			pair_coordinate = Array.new
							
			unsolved_only = true
	 		get_coordinates(unit_by_name, coordinate, unsolved_only).each { |s_coordinate|
				get_candidates(s_coordinate).each { |key, value| 
					candidates_in_unit[key] = value if value == "g" 
					candidates_in_unit[key] = 0 if candidates_in_unit.key?(key) == false 
					candidates_in_unit[key] += value if value.class == Fixnum 
				} 
				# Liste mit dne coordinaten der Zellen mit Candidates 2 oder mehr
				a_coordinate << s_coordinate if count_candidates_in_cell(coordinate)[0] > 1
			} 
			# gibt es 2 Zahlen die nur 2 mal vorkommen?
			pair_counter = 0
			pair_candidate = Array.new
			candidates_in_unit.each { |key, value| pair_candidate << key if value == 2}
			pair_candidate.each { |key| 
				candidates_in_cell = get_candidates(coordinate)
				candidates_in_cell[key] == 1 ? pair_counter += 1 : pair_candidate.delete(key)				
			}
			if pair_counter == 2
				a_coordinate.each { |s_coordinate| 
					candidates_in_cell = get_candidates(s_coordinate)
					if candidates_in_cell[pair_candidate[0]] == 1 and candidates_in_cell[pair_candidate[1]] == 1
						pair_coordinate << s_coordinate
					end	
				}
				puts "#{method_name} - pair_coordinate #{pair_coordinate} " if debug_YesNo == true
				puts "#{method_name} - pair_candidate #{pair_candidate} " if debug_YesNo == true
				puts "#{method_name} - unit_by_name #{unit_by_name} " if debug_YesNo == true
				puts "#{method_name} - rufe delete_subset_in_unit auf " if debug_YesNo == true
				if pair_coordinate.size == 2
					set_subset_in_cells(pair_candidate, pair_coordinate, "Hidden Pair")
#					delete_subset_in_unit(pair_candidate, pair_coordinate, unit_by_name, "Hidden Pair")
				end		
				hidden_pair[0] = true
				hidden_pair[1] = "Hidden Pair gefunden"
				hidden_pair[2] << pair_candidate
				hidden_pair[3] << pair_coordinate
						
			end			
			
		} # ["row", "col", "block"].each

		return hidden_pair
	end
end
