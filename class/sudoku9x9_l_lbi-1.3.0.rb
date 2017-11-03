class Suduku9x9

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # #
# # # # #					LOGIC-MODUL Nr.5
# # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


=begin
## Name 
			line_block_interaction LOGIC-MODUL Nr. 5

## Version 
			V1.3 vom 09.12.2016 23.00 Uhr
	
## Was macht die Methode?
 	Kann eine Zahl/Kandidat nur in Zellen eines Blockes vorkommen und diese Zellen sind in einer Linie
	so kann er an keiner anderen Stelle des Blockes vorkommen.
	Hole Kandidten aus der Coordinate 	
	Hole unit row oder col
	Test Kandidat in der gesamten unit. -> can_candidate_in_cell(coodinate) true/false
	sind für alle Blöcke, außer Coordinate-Block false
	dann ist es ein Block-Line-interaction
	lösche alle Zahln/Kandidaten aus dem aktuellen Block-unit
 	
## access (Methode)

## Übergabe-Variable - Welche Werte werden übergeben?  
		string coordinate 
  
## RETURN - Was liefert die Methode zurück?
	array[0] 						-> false / true 
  array[1]						-> method_name - gefunden in Reihe, Spalte oder Block
  array[2]						-> Zahl die gefunden wurde
  array[3]						-> Koordinate

=end
  def line_block_interaction(coordinate)
		method_name = set_method("line_block_interaction")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		#debug_YesNo = true
		# begin Methode
		line_block_interaction =  [false, false, [], []]
		puts "#{method_name} - line_block_interaction Zelle #{coordinate} " if debug_YesNo == true


		if is_cell_unsolved(coordinate) == true
			line_block_interaction = find_line_block_interaction(coordinate)
		end
		return line_block_interaction
	end		


	def find_line_block_interaction(coordinate)
		method_name = set_method("find_line_block_interaction")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		modified_by = @myMethod[method_name].modified_by
		#debug_YesNo = true
		line_block_interaction =  [false, false, [], []]
		found_lbi = false	
		# Hole die unit - Reihe und Spalte 
		unsolved_only = true 
		
		[ "row", "col"].each { |unit_by_name| 
			unit = get_coordinates(unit_by_name, coordinate, unsolved_only)
			# Hole alle Kandidaten
			candidates = get_candidates(coordinate)
			# a_unit generieren falls man eine Line Block Interaction findet
			this_block = get_coordinates("block", coordinate, unsolved_only)
			# Aus der unit - Reihe oder Spalte wird der Block ermittelt
			block_of_coordinate = get_blocknumber(coordinate)
			band = Hash.new
			unit.each { |s_coordinate| 
				unit_block = get_blocknumber(s_coordinate)
				band[unit_block] = s_coordinate if unit_block != block_of_coordinate
				# lösche die unit Coordinaten aus block
				this_block.delete(s_coordinate)
			}
			# Test Kandidaten in Block != aktuellem Block
			puts "#{method_name} - coordinate  #{coordinate} " if debug_YesNo == true
			puts "#{method_name} - unit_by_name  #{unit_by_name} " if debug_YesNo == true
			puts "#{method_name} - aktueller Block  #{block_of_coordinate} " if debug_YesNo == true
			puts "#{method_name} - Kandidaten #{candidates} " if debug_YesNo == true
			puts "#{method_name} - This Block #{this_block} " if debug_YesNo == true
			find_lbi = Array.new
			maybe_lbi = Hash.new
			candidates.each { |test_candidate, value|
				band.each { |block, s_coordinate|
					if value ==  1
						if maybe_lbi.key?(test_candidate) == false 
							maybe_lbi[test_candidate] = [test_candidate_in("block", test_candidate, s_coordinate)]
						else
							maybe_lbi[test_candidate] << test_candidate_in("block", test_candidate, s_coordinate)
						end
					end
				}
			}		
			maybe_lbi.each { |key, value|
				puts "#{method_name} - maybe_lbi - key #{key} -- value #{value}" if debug_YesNo == true
				if value.size == 2
					puts "#{method_name} - maybe_lbi - key #{key} -- value #{value}" if debug_YesNo == true
					find_lbi << key if value[0] == false and value[1] == false 
				else
					find_lbi << key if value[0] == false 
				end
			}
			puts "#{method_name} - gefundener Kandidat = find_lbi = #{find_lbi} " if debug_YesNo == true
			if find_lbi.size == 1
				puts "lösche die Kandidaten aus this_block #{this_block} " if debug_YesNo == true
				value = find_lbi[0]
				delete_candidates(this_block, value, modified_by)	
				found_lbi = true	
				line_block_interaction[0] = true
				line_block_interaction[1] = "Line Block Interaktion gefunden"
				line_block_interaction[2] << value
				line_block_interaction[3] << coordinate	
				#find_lbi.delete(0)	
			end
			if find_lbi.size > 1
				puts "ERROR -#{method_name} - mehr als ein Kandidaten gefunden find_fli #{find_lbi}" 
			end
			#break if found_lbi == true	
		}
		
		return line_block_interaction
	end
	
=begin
	def test_candidate_in(unit_by_name, candidate, coordinate) 
		method_name = set_method("test_candidate_in")
		debug_YesNo = @myMethod[method_name].debug_YesNo

		values_in_block = Hash.new
		return_bool = false
		
		unsolved_only = false # Betrachte alle Zellen
		values_in_block = get_values_in_unit(get_coordinates(unit_by_name, coordinate, unsolved_only))
		return_bool = true if values_in_block.key?(candidate) == false 
		return return_bool
	end


=end


end
