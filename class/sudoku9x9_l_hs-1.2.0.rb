class Suduku9x9

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # #
# # # # #					LOGIC-MODUL Nr.2
# # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


=begin
## Name 
			hidden_single LOGIC-MODUL Nr.2

## Version 
			V1.0 vom 16.11.2016 15:20 Uhr
	
## Was macht die Methode?
 	Untersuche die aktuelle Zelle und suche nach Hidden Single
	Ein Hidden Single ist die mögliche Zahl in einer Zelle, die nur einmal in
	dieser Spalte, Reihe oder dem Feld vorkommt.
	Die Methode ermittelt die möglichen Zahlen der Zelle und streicht aus der Menge alle Zahlen weg,
	die in einer anderen Zelle in der Spalte, Reihe oder dem Feld stehen können.

## access (Methode)

## Übergabe-Variable - Welche Werte werden übergeben?  
	string coordinate 
  
## RETURN - Was liefert die Methode zurück?
	array[0] 						-> false - kein Hidden Singel / true - ein Hidden Single
  array[1]						-> method_name - gefunden in Reihe, Spalte oder Feld
  array[2]						-> Zahl die gefunden wurde
  array[3]						-> Koordinate

=end
  def hidden_single(coordinate, solve_with_naked_single = true)
		method_name = set_method("hidden_single")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		solved_by = @myMethod[method_name].solved_by
	
		candidates = Hash.new
		hidden_single = Array.new
		hidden_single = [false, method_name, 0, "0/0"]
		hidden_single_value = 0
							
		candiates_in_cell = Hash.new 
	
		# ist die Zelle ungelöst?
		if is_cell_unsolved(coordinate) == true 
			# gibt es mehr als einen Kandidaten?
			if 	count_candidates_in_cell(coordinate)[0] > 1	
				# Durchlaufe die unit nach den verwendeten Value (ohne Coordiante)
				# hole die Reihe, Spalten und Blöcke
				unsolved_only = true #  nur ungelöste Zellen
				["row", "col", "block"].each { |unit_by_name|
					candiates_in_cell = get_candidates(coordinate)
					a_unit = get_coordinates(unit_by_name, coordinate, unsolved_only)
					puts "#{method_name} - unit_by_name = #{unit_by_name} ->a_unit - #{a_unit} "  if debug_YesNo == true
					a_unit.delete(coordinate) # Da coordiante eine unsolved Zelle ist
					
					# Durchlaufe a_unit und hole alle Kandidaten
					a_unit.each { |s_coordinate| 
						values_in_unit = Hash.new	
						values_in_unit = get_candidates(s_coordinate)
						# In values_in_unit sind alle Values der Unit
						# In candiates_in_cell sind alle erlaubten Zahlen der Unit
						# Durchlaufe candiates_in_cell und addiere values_in_unit
						candiates_in_cell.each { |key, value| 
							candiates_in_cell[key] += values_in_unit[key] if values_in_unit[key].class == Fixnum and value > 0
						}	
					}
					count_hidden_single = hidden_single_value = 0
					# gibt es zu einem key den value = 1?
					candiates_in_cell.each { |key, value| 
							count_hidden_single += 1 if value == 1 
							hidden_single_value = key  if value == 1 
					}
					if count_hidden_single == 1
						hidden_single = set_cell_value(coordinate, hidden_single_value, solved_by)
					end
					break if count_hidden_single == 1						
				}
				
			else
				# es ist ein Naked Single
				get_candidates(coordinate).each { |key, value| hidden_single_value = key  if value == 1 }
				hidden_single = [false, "gefundener Naked Single", hidden_single_value, coordinate]
				if solve_with_naked_single == true					
					hidden_single =  naked_single(coordinate)
				end
				puts "#{method_name} - hidden_single (#{hidden_single}) <"  if debug_YesNo == true	
			end
			puts "#{method_name} - find_hidden_single (#{hidden_single}) "  if debug_YesNo == true	
		end
		return hidden_single
  end

end
