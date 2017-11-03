class Suduku9x9

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # #
# # # # #					LOGIC-MODUL Nr.6
# # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


=begin
## Name 
			Xwing LOGIC-MODUL Nr.6

## Version 
			V1.4 vom 12.12.2016 29.00 Uhr
	
## Was macht die Methode?
	 kommt ein Kandidat nur 2 mal in einer Reihe oder spalte vor, so kann es sich um einen x-Wing handeln
 	
## access (Methode)

## Übergabe-Variable - Welche Werte werden übergeben?  
		string coordinate 
  
## RETURN - Was liefert die Methode zurück?
	array[0] 						-> false / true 
  array[1]						-> method_name - gefunden in Reihe, Spalte oder Block
  array[2]						-> Zahl die gefunden wurde
  array[3]						-> Koordinate

=end
  def xwing(coordinate)
		method_name = set_method("xwing")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		debug_YesNo = true
		# begin Methode
		xwing =  [false, false, [], []]
		coordinate = "2/1" # nr 16  
#		coordiante = "2/5" # nr 15
		puts "#{method_name} - xwing Zelle #{coordinate} " if debug_YesNo == true


		if is_cell_unsolved(coordinate) == true
			xwing = find_xwing(coordinate)
		end
		return xwing
	end		


	def find_xwing(coordinate)
		method_name = set_method("find_xwing")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		modified_by = @myMethod[method_name].modified_by
		debug_YesNo = true
		xwing =  [false, false, [], []]
		fish = Hash.new
		xwing_coordinate = Array.new

		# Durchlaufe Zeile und Spalte und suche nach dem Doppel oder
		# nach einem Kandidaten der in Spalte + Reihe um 2 häufiger vorkommt als
		# in Reihe oder Spalte alleine
 		candidates_in_unit = sum_candidates_in("row", coordinate)
		puts "#{method_name} - candidates_in_unit row #{candidates_in_unit} " if debug_YesNo == true
		candidates_in_unit.each { |key, value|
			fish[key] = value if value.to_i > 1
		}
		puts "#{method_name} - fish after row  #{fish} " if debug_YesNo == true
		candidates_in_unit = sum_candidates_in("col", coordinate, candidates_in_unit)

		puts "#{method_name} - candidates_in_unit col #{candidates_in_unit} " if debug_YesNo == true
		puts "#{method_name} - fish after row  #{fish} " if debug_YesNo == true

		fish.each { |key, value|
			puts "#{method_name} - key #{key}  value #{value} " if debug_YesNo == true
			if candidates_in_unit[key] - value  ==  2
				candidates_in_unit[key] = value
			else
				fish.delete(key)
			end

		}
		#puts "#{method_name} - fish  #{fish} " if debug_YesNo == true
		# suche die Zahl/key in den Kandidaten, ermittle die Zellenkoordinaten
		fish.each { |candidate, value|
			xwing_coordinate = search_candidate_in("row", coordinate, candidate, xwing_coordinate)
			xwing_coordinate = search_candidate_in("col", coordinate, candidate, xwing_coordinate)
		}
		puts "#{method_name} - fish  #{fish} " if debug_YesNo == true
		puts "#{method_name} - xwing_coordinate  #{xwing_coordinate} " if debug_YesNo == true
		xwing_coordinate.each { |candidate, value|
		base = Hash.new
#		cover = Hash.new
			value.each { |s_coordinate|
				puts "#{method_name} - s_coordinate  #{s_coordinate} " if debug_YesNo == true			
#				puts "#{method_name} - rownumber  #{get_rownumber(s_coordinate)} " if debug_YesNo == true
#				puts "#{method_name} - colnumber  #{get_colnumber(s_coordinate)} " if debug_YesNo == true
				base.key?(get_rownumber(s_coordinate)) == true ? base[get_rownumber(s_coordinate)] << s_coordinate : base[get_rownumber(s_coordinate)] = [s_coordinate]
#				cover.key?(get_colnumber(s_coordinate)) == true ? cover[get_colnumber(s_coordinate)] << s_coordinate : cover[get_colnumber(s_coordinate)] = [s_coordinate]
			}
		fish[candidate] = base #[base, cover]
		
		}
		puts "#{method_name} - fish  #{fish} " if debug_YesNo == true
		fish.each { |fishnumber, base|
			puts "#{method_name} - fishnumber  #{fishnumber} " if debug_YesNo == true
			puts "#{method_name} - base  #{base} " if debug_YesNo == true
			puts "#{method_name} - base.size  #{base.size} " if debug_YesNo == true
			
			if base.size == 2
				base_1 = base_2 = 0
				base.each { |key, value| 
					if base_1 == 0 
						base_1 = key
					else
						base_2 = key
					end
				}
				puts "#{method_name} - base_1  #{base_1} " if debug_YesNo == true
				puts "#{method_name} - base_1  #{base[base_1]} " if debug_YesNo == true
				puts "#{method_name} - base_2  #{base_2} " if debug_YesNo == true
				# lösche koordinate aus base_1
				base[base_1].delete(coordinate)
				base[base_1].each { |cover_coordinate|
#					base[base_2].each { |base_coordinate|
					puts "#{method_name} - cover_coordinate  #{cover_coordinate} " if debug_YesNo == true
#						puts "#{method_name} - base_coordinate  #{base_coordinate} " if debug_YesNo == true
					puts "#{method_name} - Candidate: cover_coordinate  #{get_candidates(cover_coordinate)} " if debug_YesNo == true
					xwing_cell = "#{base_2}/#{get_colnumber(cover_coordinate)}"					
					puts "#{method_name} - xwing_cell  #{xwing_cell} " if debug_YesNo == true
					puts "#{method_name} - Candidate: xwing_cell  #{get_candidates(xwing_cell)} " if debug_YesNo == true
					if get_candidates(xwing_cell) != get_candidates(cover_coordinate) 
#						base[base_1].delete(cover_coordinate)
						puts "#{method_name} - ungleiche Kandidatenliste - lösche Koordinate" if debug_YesNo == true
					
					end
#					}
				}	
			else
				puts "#{method_name} - base.size  #{base.size} " if debug_YesNo == true
				puts " ERROR zu lang!"
			end

		}
			puts "#{method_name} - fish  #{fish} " if debug_YesNo == true


		# xwing_coordinate beinhaltet nun die Zell-Koordianten die möglich wären
		# Rechteck aufspannen

		# ein rechteck?
		# base in Row? 
#		base = Hash.new
#		base[get_rownumber(coordinate)] = [coordinate]
#		cover = Hash.new
#		cover[get_colnumber(coordinate)] = [coordinate]
=begin	
		xwing_coordinate.each { |candidate, value|
			base = Hash.new
			base[candidate] = Hash.new
			# [candidate][rownumber]
			base[candidate][get_rownumber(coordinate)] = [coordinate]
			cover = Hash.new
			cover[candidate] = Hash.new
			# [candidate][colnumnber]
			cover[candidate][get_colnumber(coordinate)] = [coordinate]
			count_row = count_col = 0
			value.each { |s_coordinate|
				count_row += 1 if get_rownumber(s_coordinate) == get_rownumber(coordinate)
				count_col += 1 if get_colnumber(s_coordinate) == get_colnumber(coordinate)
				if get_rownumber(s_coordinate) == get_rownumber(coordinate)
					 base[candidate][get_rownumber(coordinate)] << s_coordinate if base[candidate][get_rownumber(coordinate)].include?(s_coordinate) == false
				end
#				cover[get_colnumber(coordinate)] << s_coordinate if get_colnumber(s_coordinate) == get_colnumber(coordinate)
				if get_colnumber(s_coordinate) == get_colnumber(coordinate)
					cover[candidate][get_colnumber(coordinate)] << s_coordinate if cover[candidate][get_colnumber(coordinate)].include?(s_coordinate) == false
				end
				
			}
			puts "#{method_name} - count_row  #{count_row} " if debug_YesNo == true	
			puts "#{method_name} - count_col  #{count_col} " if debug_YesNo == true	
			puts "#{method_name} - base  #{base} " if debug_YesNo == true	
			puts "#{method_name} - cover  #{cover} " if debug_YesNo == true	
			
		}
=end
		# in base und cover liegen nun die Koordinaten je Fisch
		# durchlaufe base mit fisch 1 und teste alle Kooridinaten mit cover 
		# test auf Reihe oder Spalte - NÖTIG?
		#base.each { |key, value|

		return xwing
	end
	
 def sum_candidates_in(unit_by_name, coordinate, candidates_in_unit = Hash.new	)
 		method_name = "sum_candidates_in"
 		debug_YesNo = false
 		
 		unsolved_only = true
 		a_unit = get_coordinates(unit_by_name, coordinate, unsolved_only)
		puts "#{method_name} - unit_by_name col #{unit_by_name} " if debug_YesNo == true
		puts "#{method_name} - a_unit col #{a_unit} " if debug_YesNo == true
		puts "#{method_name} - a_unit col #{a_unit} " if debug_YesNo == true
		#candidates_in_unit = Hash.new	
		a_unit.each { |s_coordinate| 
			get_candidates(s_coordinate).each { |key, value| 
				candidates_in_unit[key] = value if value == "g" 
				candidates_in_unit[key] = 0 if candidates_in_unit.key?(key) == false 
				candidates_in_unit[key] += value if value.class == Fixnum 
			} 
		}
		return candidates_in_unit
	end

	def search_candidate_in(unit_by_name, coordinate, candidate, coordinates)
 		method_name = "search_candidate_in"
 		debug_YesNo = false

		coordinates = Hash.new if coordinates.class != Hash
 		unsolved_only = true
 		a_unit = get_coordinates(unit_by_name, coordinate, unsolved_only)
		puts "#{method_name} - a_unit  #{a_unit} " if debug_YesNo == true
 		a_unit.each { |s_coordinate|
 			if get_candidates(s_coordinate)[candidate] == 1 		
				puts "#{method_name} - s_coordinate  #{s_coordinate} " if debug_YesNo == true
 				if coordinates.key?(candidate) == false 
 					coordinates[candidate] = [ s_coordinate ] 
 				else 
 					if coordinates[candidate].include?(s_coordinate) == false
 						coordinates[candidate] << s_coordinate
 					end
 				end
 				puts "#{method_name} - coordinates  #{coordinates} " if debug_YesNo == true
 			end
		}
		return coordinates
	end

end
