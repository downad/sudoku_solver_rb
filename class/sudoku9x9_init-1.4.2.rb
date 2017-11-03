class Suduku9x9 
=begin
************************************
***           BEGRIFFE           ***
************************************
grid 				Das ganze Sudoku wird als Gitter (engl.: grid) bezeichnet. 
cell				Ein Sudoku besteht aus Zellen
values			Zellen werden gefüllt mit Werten (engl.: values).
givens			Die Werte, die zu Beginn bereits vorhanden sind, sind die Angaben (engl.: givens)
candidates	Mögliche Werte für noch nicht gefüllte Zellen sind Kandidaten (engl.: candidates).
unit				Zeilen, Spalten oder Blöcke werden unit genannt.
row					Zeilen (engl.: rows, mit "r" abgekürzt), 
col					Spalten (engl.: columns, mit "c" abgekürzt) und 
block				Blöcke (engl.: boxes oder blocks, mit "b" abgekürzt") angeordnet.
band				Drei Blöcke in einer Reihe sind ein Band (engl.: band). 
floor				Ein horizontales Band ist ein Stock (engl.: floor).
tower				Ein vertikales ist ein Turm (engl.: tower). 


************************************
***           Roadmap            ***
************************************
Logik-Module fertigmachen
1.0 	Naked Single 
1.0 	Hidden Single
1.1	Naked Pair
1.2	Hidden Pair
1.3  Block Line Interaktion
1.4	XWing
1.5	...

 
************************************
***           Versions           ***
***              und             ***
***          Änderungen          ***
************************************
 1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver
 1.0.1 - 16.11.2016 INFO candidates in class-sudoku1x1 hinzugefügt. 
 1.0.2 - 16.11.2016 INFO modified_by in class-Sudoku1x1 hinzugefügt. 
 1.0.3 - 16.11.2016 INFO delete_number_in_section hinzugefüg
 1.0.4 - 20.11.2016 INFO Klasse Sudoku9x9 in einzelne Dateien aufgeteilt. 
 1.0.5 - 28.11.2016 INFO Klasse Method eingefügt.
 1.0.6 - 28.11.2016 INFO Flag unsolved_only hinzugefügt.
 1.0.7 - 28.11.2016 INFO Flag return_all hinzugefügt
 1.0.8 - 30.11.2016 INFO Überarbeitung init. Anpassungs an Nomenklatur, Anpassen der Klasse
 1.0.9 - 30.11.2016 INFO umgestaltet aus get_block.
 1.0.10- 02.12.2016 INFO Naked Single angepasst.
 1.0.11- 02.12.2016 INFO Hidden Single neu gemacht und angepasst.
 1.0.12- 07.12.2016 NEW 	count_candidates_in_cell.
 1.0.13- 07.12.2016 INFO	New Naked Pair. 
 1.0.14- 07.12.2016 BUGFIX	in get_coordinates
 1.0.15- 08.12.2016 INFO Hidden Pair neu gemacht und angepasst.
 1.0.16- 08.12.2016 NEW delete_subset_in_unit.
 1.0.17- 08.12.2016 NEW set_subset_in_cells.
 1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden
 													set_method(method_name) eingeführt. Eigene Datei! sudoku9x9_doku-1.2.0.rb
 1.2.1 -	08.12.2016 NEW Versionsystem, Anpassungen an class_method.rb ->class_method-1.2.1.rb
 1.2.2 - 08.12.2016 INFO Loop in Methode get_values_in_rcb"
 1.2.3 - 08.12.2016 INFO Returnvalue in Methode get_coordinates_of_unsolved_cell auf Array geändert
 1.2.4 - 09.12.2016 INFO get_sudoku_cells umgestellt auf get_sudoku_cells(html_help = true)
 1.2.5 - 09.12.2016 INFO hidden_single erweiter default wird Naked Single mitgelöst
 1.2.6 - 09.12.2016 NEW method solvingsteps
 1.3.1 - 09.12.2016 NEW method block_line_interaction 
 										NEW test_candidate_in(unit_by_name, candidate, coordinate)
 1.4.0 - 12.12.2016 NEW method X-Wing
 1.4.1 - 12.12.2016 NEW get_rownumber(coordinate),get_colnumber(coordinate),get_blocknumber(coordinate)
 1.4.2 - 12.12.2016 MODIFY set_cell_value, 
 										NEW test_candidate_in_rcb(candidate, coordinate)
 										DELETE method is_value_allowed_in_rcb(candidate, coordinate)
 
 
 


************************************
***           Methoden           ***
************************************
Keine Rückgabe
	 initialize(game)
   print_grid
	 count_unsolved_cell
	 
Array Rückgabe	 
	 count_candidates_in_cell(coordinate)


   get_sudoku_cells(html_help = true)
	 get_candidates(coordinate)
	 get_values_in_rcb(coordinate)
	 get_values_in_unit(a_unit)
	 get_coordinates(unit_by_name, coordinate, unsolved_only = false)
	 get_solved_by_text_of_cells(sort, write_soved_by_text_to_file = false)
	 get_coordinates_of_unsolved_cell


Bool Rückgabe
	 is_grid_solved
	 is_coordinate_allowed(coordinate) 	
	 			Überprüft ob die Koordinate /Coordinate erlaubt ist.	
	 is_value_allowed(value)
	 is_cell_unsolved(coordinate, return_all = false)
	 			Überprüfe ob die Zelle ungelöst ist.
	 			Überprüft ob die Koordinae erlaubt ist.
	 test_candidate_in_rcb(coordinate, value)
	 test_candidate_in(unit_by_name, coordinate, value)

   set_cell_value(coordinate, value, solved_by_Logic)
	 set_subset_in_cells(subset_values, subset_coordinate, modified_by)

	 delete_candidates(a_unit, value, modified_by)
	 
	 delete_subset_in_unit(subset_values, subset_coordinate, unit_by_name, modified_by)




=end



=begin
## Name 
			initialize

## Was macht die Methode?
   		Initialisiere das Spiel, wird einmalig über sudoku9x9.new aufgerufen
			Es werden klassenweite Variablen definert 	
			@range_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9] - Array, Beinhaltent den Zahlenraum 1..9 beim 9x9 Sudoku

			Klasse Sudoko1x1
			@cell = Hash.new		- eine Klasse Sudoko1x1, die kleinste Einheit im Sudoku
				Der Hashkey ist die Zellkoordianten. 
				Startwerte sind:  
					coordinate				string, die Koordinate der Zelle
					row, col, block		int, zu welcher Reihe, Spalte und Feld gehört sie
					value							int, welche Zahl steht drin 	
					startvalue				bool, ist es ein Startwert = true  
					solved						bool, ist die Zelle gelöst = true

			Klasse Unit, werden mit .set gesetzt und bei Bedarf mit .get geholt 
				@row = Hash.new		- Liste mit den Koordinaten einer Reihe / Reihe[1] = {"1/1", "1/2", ...}
				@col = Hash.new		- Liste mit den Koordinaten der Spalte
				@block = Hash.new - Liste mit den Koordinaten der Felder

## access (Methode)
=end
	def initialize(game)
		@myMethod = Hash.new
		method_name = set_method("initialize")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		# Cell = Zelle des Spiel
		@cell = Hash.new
		# @row, @col, @block ist ein Hash, key = Rownumber, Colnumber oder Fieldnumber
		@row = Hash.new
		@col = Hash.new
		@block = Hash.new
		
		#Die Schritte bis zur Lösung
		@solvingsteps = Array.new
		@sudoku_log = Hash.new

		#@range_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9] 
		# @range_of_numbers der verwendete Zahlenraum
		# wir ermittelt aus dem Übergebenen Spiel
		@range_of_numbers = Array.new
		count = 0
		game[1].each do |x|
			count += 1
			@range_of_numbers << count
		end

		# Fülle @cell, @row, @col, @block
		@range_of_numbers.each do |rownumber|
			@range_of_numbers.each  do |colnumber|
				coordinate = "#{rownumber}/#{colnumber}"
				blocknumber = ((colnumber - 1) / 3) + ((rownumber - 1) / 3 ) * 3
			 	# um Felder bei 1 beginnen zu lassen
				blocknumber +=1
				value = game[rownumber][colnumber-1]
				if value == 0 
					given = false
					solved = false
					# candidates anlegen!
					candidates = "n" 
				else
					given = true
					solved = true
					candidates = "solved"
				end
				puts "#{@myMethod[method_name].text} - coordinate = #{coordinate} - value = #{value}" if debug_YesNo == true
				@cell[coordinate] = Sudoku1x1.new(coordinate, rownumber, colnumber, blocknumber, value, given, solved, candidates)
				@row.key?(rownumber) == false ? @row[rownumber] = Unit.new(coordinate) : @row[rownumber].set(coordinate) 
				@col.key?(colnumber) == false ? @col[colnumber] = Unit.new(coordinate) : @col[colnumber].set(coordinate) 
				@block.key?(blocknumber) == false ? @block[blocknumber] = Unit.new(coordinate) : @block[blocknumber].set(coordinate) 
				@solvingsteps << "Setze in die Zelle(#{coordinate}) die Zahl #{value} - [given]" if value > 0
				sudoku_log(coordinate, value, "[given]", true) if value > 0
			end
		end
	end



=begin
## Name 
			solvingsteps

## Was macht die Methode?
			Erzeuge einen Ausgabestring mit den Schritten zum Lösen des Sudoku 

## access (Methode)
=end
	def solvingsteps
		method_name = set_method("solvingsteps")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		returnvalue = ""
		@solvingsteps.each { |value| returnvalue << "\n #{value}" }
		return returnvalue
	end
	
	def sudoku_log(coordinate, value, modified_by, solved = false)
		#method_name = set_method("solvingsteps")
		#debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode
		if @sudoku_log.key?(coordinate) == false 
			@sudoku_log[coordinate] = Sudoku_log.new
		end
		if solved == false
			@sudoku_log[coordinate].delete_candidate(value, modified_by)
		else
			@sudoku_log[coordinate].set_value(value, modified_by)
		end
	end
	def print_sudoku_log
		returnvalue = ""
#		@sudoku_log.each { |key, value| returnvalue << "\n#{key} -  #{value}" }
		@cell.each { |key, value| returnvalue << "\n#{key} -  #{@sudoku_log[key].get_log}" }

		return returnvalue
	end


=begin
## Name 
			print_grid

## Was macht die Methode?
			Erzeuge eine Ausgabe auf der Konsole mit dem aktuellen Sudoku 	
			printcolor = true
			Dabei werden Startwerte in grün	und gelöster Zellen in blau dargestellt

## access (Methode)
=end
  def print_grid
		method_name = set_method("print_grid")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		# Soll der Ausdruck in Farbe sein?
		printcolor = true
		puts "\n\n     1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 "
		puts "   |=========== =========== ==========="
    @range_of_numbers.each do |rownumber|
      output = ""
 			@range_of_numbers.each do |colnumber|
	  		coordinate = "#{rownumber}/#{colnumber}"
				if rownumber > 0 and colnumber > 0
					cellvalue = @cell[coordinate].value
				end
				if @cell[coordinate].b_given == true and printcolor == true
					a = String
					a =	cellvalue.to_s
					cellvalue = a.green #mögliche weitere Farben red green yellow blue pink light_blue
				else 
					if @cell[coordinate].b_solved == true and printcolor == true
						a = String
						a =	cellvalue.to_s
						cellvalue = a.light_blue #red green yellow blue pink light_blue
					end
				end
				colnumber == 1 ? output << " Z#{rownumber}|" : output << "|"
        cellvalue == 0 ? output << "   " : output << " #{cellvalue} " 
      end
      puts output 
      rownumber % 3 == 0 ? puts("   |=========== =========== ===========") : puts("   |----------- ----------- -----------")
    end 
		puts ""
  end 




=begin
## Name 
			get_sudoku_cells

## Was macht die Methode?
  		Erzeuge einen Hash mit den Werten der Zellen.
			ist der Zellenwert 			
				0 = ungelöste Zelle
	  		> 0 gelöste Zelle
				< 0 Zellen zu Spielbeginn
	 		html_help = true, dann wird ein String erzeut, der mit <br> den html-code umbricht	
	  	Return: 
				Array mit den Werten des Sudoku

## access (Methode)
=end
  def get_sudoku_cells(html_help = true)
  	method_name = set_method("get_sudoku_cells")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		sudoku_cells = Hash.new
		# muss um eins mehr sein als @range_of_mumbers
		# mögliches konstrukt
		sudoku_cells[0] = [0]
		1.upto(@range_of_numbers.length) { |count| sudoku_cells[0] << "0" }

		@range_of_numbers.each { |rownumber|
			sudoku_cells[rownumber] = [0]
 			@range_of_numbers.each { |colnumber|
	 			coordinate = "#{rownumber}/#{colnumber}"
				cellvalue = @cell[coordinate].value
				if @cell[coordinate].b_given == true 
					cellvalue = (-1) * cellvalue 
					sudoku_cells[rownumber] << cellvalue
				else # if @cell[coordinate].b_given == true 
					if @cell[coordinate].b_solved == false
						if html_help == true
							help = []
							number_matrix = ""
							help = get_candidates(coordinate)
							help.each_key do |number|
								help[number] == 1 ?	number_matrix << "#{number}&nbsp;" : number_matrix << "&nbsp;&nbsp;"
								number % 3 == 0 ? number_matrix << "<br>" : number_matrix << ""
							end #help.each_key do |number|
							sudoku_cells[rownumber] << number_matrix #[1,2,3]
						else 
							sudoku_cells[rownumber] << 0
						end 
					else # if @cell[coordinate].b_solved == false
						sudoku_cells[rownumber] << cellvalue
					end #if @cell[coordinate].b_solved == false
	      end # if @cell[coordinate].b_given == true 
			} # @range_of_numbers.each do |colnumber|
    } #@range_of_numbers.each do |rownumber|
		return sudoku_cells
  end 



=begin
## Name 
			get_candidate

## Was macht die Methode?
	Es werden alle Zahlen bestimmt die in Reihe, Splate und Block vorkommen.
	Diese sind als Kandidaten nicht erlaubt.
	Die nicht genannten Zahlen sind die Kandidaten.
	Bsp.:
	{1=>0, 2=>1, 3=>1, 4=>0, 5=>1, 6=>0, 7=>1, 8=>0, 9=>0}
	ERLAUBT sind in dieser Zelle die Zahlen 2, 3, 5 und 7
	0 bedeutet, dass die Zahl nicht erlaubt ist.
	 
## access (Methode)
=end
	def get_candidates(coordinate)
		method_name = set_method("get_candidate")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		h_candidate = Hash.new
		# hat die Zelle einen  @cell[coordinate].get_candidate[0] eintrag?
		if ["n", "g", "solved"].include?( @cell[coordinate].get_candidates[0]) == true 
			puts "#{method_name} - Zelle(#{coordinate}) #{@cell[coordinate].get_candidate}" if debug_YesNo == true	

			# Wurde in dieser Zelle schon Kandidaten gesetzt? 
			#	ja, dann steht in [0] == "g"
			if @cell[coordinate].get_candidates[0] == "g"
				puts "#{method_name} - Zelle(#{coordinate}) get_candidate[0] = g" if debug_YesNo == true	
				h_candidate = @cell[coordinate].get_candidates
			end	#if @cell[coordinate].get_candidate[0] == "g"

			# Wurde in dieser Zelle schon Kandidaten gesetzt? 
			#	Nein, dann steht in [0] == "n"
			if @cell[coordinate].get_candidates[0] == "n" 	
				puts "#{method_name} - Zelle(#{coordinate}) get_candidate[0] = n" if debug_YesNo == true	
				# Welche Zahlen sind in der Zelle nicht erlaubt?
				not_allowed_values = get_values_in_rcb(coordinate)
				puts "#{method_name} - not_allowed_values(#{coordinate}) #{not_allowed_values} " if debug_YesNo == true	
				not_allowed_values.each_key do |key|
					not_allowed_values[key] == 1 ? h_candidate[key] = 0 : h_candidate[key] = 1
				end 
				puts "#{method_name} - candidates(#{coordinate})   #{h_candidate} " if debug_YesNo == true 
				@cell[coordinate].set_candidates(h_candidate)
				puts "#{method_name} - nach dem setzen #{@cell[coordinate].get_candidate} " if debug_YesNo == true 
			end

			if @cell[coordinate].get_candidates[0] == "solved"
				puts "#{method_name} - Zelle(#{coordinate}) get_candidate[0] = solved" if debug_YesNo == true	
				h_candidate[0] = "solved"
			end
			puts "#{method_name} - ende? #{@cell[coordinate].get_candidate}" if debug_YesNo == true	
			return h_candidate.clone
		else
			puts "ERROR - #{@myMethod[method_name].text} - die Zelle(#{coordinate}) ist nicht leer!!!" if debug_YesNo == true	
		end
	end



=begin
## Name 
			get_values_in_rcb

## Was macht die Methode?
			Holt aus @cell[].row, @cell[].col und @cell[].block den Key 
			für @row[].get, @col[].get und @block[].get 
			Druchläuft dann für jede Reihe, Spalte und Feld und holt die Values
			Return:
				Hash values_rcb 
	 
## access (Methode)
=end
	def get_values_in_rcb(coordinate)
		method_name = set_method("get_values_in_rcb")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		values_rcb = Hash.new
		@range_of_numbers.each do |key|
			values_rcb[key] = 0
		end
		unsolved_only = false
		["row", "col", "block"].each { |unit_by_name|
			get_values_in_unit(get_coordinates(unit_by_name, coordinate, unsolved_only)).each { |key, value| 
				values_rcb[key] = 1 if value == 1
			}   
		}		
		return values_rcb.clone
	end



=begin
## Name 
			get_values_in_unit

## Was macht die Methode
			Durchläuft alle Zellen der Auswahl / Unit und erzeut ein
			Hash mit den Zahlen und dem Wert 1, wenn die Zahl der Auswahl vorkommt
			Bsp.:
					{1=>0, 2=>1, 3=>1, 4=>0, 5=>1, 6=>0, 7=>1, 8=>0, 9=>0}
			In dieser Unit kommen die Zahlen 2, 3, 5 und 7 vor
					0 bedeutet, dass die Zahl nicht vorkommt

## access (Methode)
=end
	def get_values_in_unit(a_unit)
		method_name = set_method("get_values_in_unit")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		values = Hash.new

		a_unit.each { |unit_coordinate|
			if @cell[unit_coordinate].b_solved == true
				values[@cell[unit_coordinate].value] = 1
				puts "#{@myMethod[method_name].text}: - value = #{value}"  if debug_YesNo == true
			end
		}
		return values
	end



=begin
## Name 
			get_coordinates

## Was macht die Methode?
			hole einen Array der Unit ( Reihe, die Spalte oder Block) zu der die Zelle gehört
			unsolved_only = true - liefert nur die Koodinaten der ungelösten tellen.

## access (Methode)
=end
	def get_coordinates(unit_by_name, coordinate, unsolved_only = false)
		method_name = set_method("get_coordinates")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		a_unit = Array.new
		
		if ["row", "col", "block"].include?(unit_by_name) == true
			a_unit = @row[get_rownumber(coordinate)].get if unit_by_name == "row"
			a_unit = @col[get_colnumber(coordinate)].get if unit_by_name == "col"
			a_unit = @block[get_blocknumber(coordinate)].get if unit_by_name == "block"
			puts "a_unit = #{a_unit} unit_by_name = #{unit_by_name}" if debug_YesNo == true
			if unsolved_only == true
				a_unit_all = a_unit.clone
				a_unit = Array.new	
				a_unit_all.each { |s_coordinate| a_unit << s_coordinate if is_cell_unsolved(s_coordinate) == true}
			end
			return a_unit
		else
			puts "ERROR #{method_name} -> Falsche Übergabe #{unit}, erlaubt ist [row, col, block]" 
			return "ERROR - #{method_name}"
		end		
	end



=begin
## Name 
			get_blocknumber

## Was macht die Methode?
		Hole die Reihennummer aus der Zelle

## access (Methode)
=end
	def get_rownumber(coordinate)
		method_name = set_method("get_rownumber")
		return @cell[coordinate].row
	end


=begin
## Name 
			get_blocknumber

## Was macht die Methode?
		Hole die Spaltennummer aus der Zelle

## access (Methode)
=end
	def get_colnumber(coordinate)
		method_name = set_method("get_colnumber")
		return @cell[coordinate].col
	end
	


=begin
## Name 
			get_blocknumber

## Was macht die Methode?
		Hole die Blocknummer aus der Zelle

## access (Methode)
=end
	def get_blocknumber(coordinate)
		method_name = set_method("get_blocknumber")
		return @cell[coordinate].block
	end
	
	

	
=begin
## Name 
			get_name_cell_solved_by

## Was macht die Methode?
		Erstellt eine Liste / String mit den solved_by-Werten der @cell 

## access (Methode)
=end
	def get_solved_by_text_of_cells(sort, write_soved_by_text_to_file = false)
		method_name = set_method("get_solved_by_text_of_cells")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode
		
		allowed_sort = ["sortiert", "unsortiert", "modyfied_by"]
  	if allowed_sort.include?(sort) == false
			puts "ERROR #{method_name}- Falscher Übergabewert! Erlaubte Werte allowed_sort = #{allowed_sort}"
		end
		returnvalue = Hash.new
		case sort
		when "unsortiert"
			@cell.each_key { |coordinate|		
				if @cell[coordinate].b_solved == true
					returnvalue[coordinate] = @cell[coordinate].solved_by
				end
			}
		when "sortiert"
			solved_by_name = Hash.new
			@cell.each_key { |coordinate|		
				if @cell[coordinate].b_solved == true
					returnvalue[coordinate] = @cell[coordinate].solved_by
				end
			}
			returnvalue.each { |key, name|
				solved_by_name.key?(name) == true ? solved_by_name[name] +=1 : solved_by_name[name] = 1
			}
			returnvalue = Array.new
			returnvalue = "Auswertung: \n"
			solved_by_name.each_key { |text|
				value = solved_by_name[text]
				returnvalue << "#{value} mal #{text}\n"
			}
		when "modyfied_by"
			@cell.each_key { |coordinate|		
				if @cell[coordinate].b_solved == true
					returnvalue[coordinate] = @cell[coordinate].modified_by[0]
				end
			}
		end

		@myMethod.each_key { |key| returnvalue << @myMethod[key].write_to_file } if write_soved_by_text_to_file == true
		return returnvalue
	end



=begin
## Name 
			is_solved

## Was macht die Methode?
		prüft ob das Spiel gelöst wurde, dazu werden die freien Zellen gezählt 
		liefert gelöst = true oder ungelöst = false zurück

## access (Methode)
=end
	def is_grid_solved
		method_name = set_method("is_grid_solved")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		izahl = get_coordinates_of_unsolved_cell.size 
		izahl == 0 ? returnvalue = true : returnvalue = false
		return returnvalue
	end



=begin
## Name 
			count_unsolved_cell

## Was macht die Methode?
		prüft ob das Spiel gelöst wurde, dazu werden die freien Zellen gezählt 
		liefert gelöst = true oder ungelöst = false zurück

## access (Methode)
=end
	def count_unsolved_cell
		method_name = set_method("count_unsolved_cell")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode
		
		izahl = get_coordinates_of_unsolved_cell.size 
		return izahl
	end



=begin
## Name 
			get_coordinate_of_unsolved_cell

## Was macht die Methode?
	liefert einen Hash mit den Koordinaten der leeren Sudoku-Felder

## access (Methode)
=end
	def get_coordinates_of_unsolved_cell
		method_name = set_method("get_coordinates_of_unsolved_cell")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode
		
		returnvalue = Array.new
		@cell.each_key do |coordinate|		
			if @cell[coordinate].b_solved == false
				returnvalue << coordinate 
			end
		end
		return returnvalue
	end



=begin
## Name 
			is_coordinate_allowed
	
## Was macht die Methode?
			Überprüft die übergebene Coordinate 
			Gibt es einen @cell.key? Eintrag?
			Return: 
			[false/true, Text]

## access (Methode)
=end
	def is_coordinate_allowed(coordinate) 	
		method_name = set_method("is_coordinate_allowed")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		returnvalue = false
		if @cell.key?(coordinate) == true
			returnvalue = true 
		end
		return returnvalue
	end



=begin
## Name 
			is_value_allowed
	
## Was macht die Methode?
			Überprüft ob die übergebene Value/Zahl in @range_of_numbers existiert.
			Return: 
			false/true

## access (Methode)
=end
	def is_value_allowed(value)
		method_name = set_method("is_value_allowed")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode	
		
		returnvalue = false 
		if @range_of_numbers.include?(value) == true
			returnvalue = true 
		end
		return returnvalue
	end



=begin
## Name 
			is_cell_unsolved

## Was macht die Methode?
			Überprüfe ob die Zelle ungelöst ist  
			Überprüft dabei auch ob die Koordinae erlaubt ist.
			Return: 
			[false/true, Text]

## access (Methode)
=end
	def is_cell_unsolved(coordinate, return_all = false)
		method_name = set_method("is_cell_unsolved")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		returnvalue = [false, "Diese Zelle ist nicht leer." ]
		#b_coordiante_is_allowed = is_coordinate_allowed(coordinate)
		if is_coordinate_allowed(coordinate) == true
			if @cell[coordinate].b_solved == false
				returnvalue = [true, "#{method_name} Die Zelle #{coordinate} ist leer."] if return_all == true
				returnvalue = true if return_all == false
			else
				returnvalue = [false, "#{method_name} Zelle hat den Wert #{@cell[coordinate].value}"] if return_all == true
				returnvalue = false if return_all == false
			end
		end
		return returnvalue
	end



=begin
## Name 
			set_number_in_cell

## Was macht die Methode?
			Prüfungen
			Ist coordinate eine erlaubte Koordinate?
			Ist die Zelle leer?
			Ist die übergeben Zahl erlaubt?
			Ist die Zahl in der Reihe, der Spalte und dem Feld erlaubt?
			
			Setze die Zahl in @cell[coordinate]
			Lösche die Zahl aus allen allowed_numbers der Zellen in der Reihe, der Spalte und dem Feld.  
	
			Return: 
			array returnvalue	
					[0] false - Zahl geht nicht, true Zahl passt
					[1] Text
					[2] Zahl
					[3] Koordinate 

## access (Methode)
=end
  def set_cell_value(coordinate, value, solved_by_Logic)
		method_name = set_method("set_cell_value")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		returnvalue = Array.new
		returnvalue = [false, false, "0", "0/0"]

		test_things = false
		# Ist die Zelle leer? Und ist die Kooridinate ein Hash von @cell?
		if is_coordinate_allowed(coordinate)  == true
	    test_things = is_cell_unsolved(coordinate)
			puts "#{@myMethod[method_name].text} Zelle(#{coordinate}) - Leer? #{returnvalue}" if debug_YesNo == true 
		end

		# Ist Number eine erlaubte Zahl?
		if test_things == true
	    test_things = is_value_allowed(value)
			puts "#{@myMethod[method_name].text} Zelle(#{coordinate}) - erlaubte Zahl? #{returnvalue}" if debug_YesNo == true 
		end

		# Ist number in Reihe, Spalte und Feld erlaubt?
		if test_things == true 
			test_things =  test_candidate_in_rcb(value, coordinate) 
			puts "#{@myMethod[method_name].text} Zelle(#{coordinate}) - Zahl erlaubt in R, S, F? #{returnvalue}" if debug_YesNo == true 
		end

		# Setze die Zahl in die Zelle und setze b_solved = true
		delete_candidate = false	
		if test_things == true 
			@cell[coordinate].solved(value, solved_by_Logic) 
			@solvingsteps << "Setze in die Zelle(#{coordinate}) die Zahl #{value} - [#{solved_by_Logic}]"
			sudoku_log(coordinate, value, solved_by_Logic, true)
			returnvalue = [true, "#{@myMethod[method_name].text}:\n Die Zahl #{value} wurde in Zelle #{coordinate} gesetzt.", value, coordinate]
			puts "#{@myMethod[method_name].text} Zahl gesetzt! >#{returnvalue}<" if debug_YesNo == true 
			delete_candidate = true
		end
		
		# Lösche die Zahl aus der Liste der allowed_number  
		if delete_candidate == true 
				puts @cell[coordinate].print_cell if debug_YesNo == true
				puts "#{@myMethod[method_name].text} delete - value #{value}" if debug_YesNo == true 
				unsolved_only = true
				delete_candidates(get_coordinates("row", coordinate, unsolved_only), value, solved_by_Logic)
				delete_candidates(get_coordinates("col", coordinate, unsolved_only), value, solved_by_Logic)
				delete_candidates(get_coordinates("block", coordinate, unsolved_only), value, solved_by_Logic)
		end
    return returnvalue
  end



=begin
## Name 
			test_candidate_in_rcb
	
## Was macht die Methode?
 			Ist die Zahl in der Reihe erlaubt?
			Ist die Zahl in der Spalte erlaubt?
			Ist die Zahl im Feld erlaubt?
			Return: 
			[false/true, Text]

## access (Methode)
=end
	def test_candidate_in_rcb(candidate, coordinate)
		method_name = set_method("test_candidate_in_rcb") 
		debug_YesNo = true #@myMethod[method_name].debug_YesNo
		# begin Methode
		puts "#{@myMethod[method_name].text} - candidate: #{candidate} - " if debug_YesNo == true
		puts "#{@myMethod[method_name].text} - coordinate: #{coordinate} - " if debug_YesNo == true
		test_candidate = 0
		["row", "col", "block"].each { |unit_by_name|
			test_candidate +=1 if test_candidate_in(unit_by_name, candidate, coordinate) == true
		}
		if test_candidate == 3
			returnvalue = true
		else
			returnvalue = false
			puts "#{@myMethod[method_name].text} - Zahl: #{number} - Die Zahl gibt es schon" if debug_YesNo == true
		end
		return returnvalue
	end
	
	def test_candidate_in(unit_by_name, candidate, coordinate) 
		#method_name = set_method("test_candidate_in")
		#debug_YesNo = true #@myMethod[method_name].debug_YesNo

		values_in_block = Hash.new
		return_bool = false
		# Return true wenn der Kandidat passt
		unsolved_only = false # Betrachte alle Zellen
		values_in_block = get_values_in_unit(get_coordinates(unit_by_name, coordinate, unsolved_only))
		return_bool = true if values_in_block.key?(candidate) == false 
		return return_bool
	end


=begin
## Name 
			delete_number_in_section

## Was macht die Methode?
			Lösche in jeder erlaubten Zelle aus der Liste a_unit die Zahl/value

## access (Methode)
=end
	def delete_candidates(a_unit, value, modified_by)
		method_name = set_method("delete_candidates")		
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode

		puts "#{@myMethod[method_name].text} - a_unit  #{a_unit} " if debug_YesNo == true	
		puts "#{@myMethod[method_name].text} - value  #{value} " if debug_YesNo == true	
		puts "#{@myMethod[method_name].text} - modified_by  #{modified_by} " if debug_YesNo == true	
		a_unit.each do |unit_coordinate|
			puts "#{@myMethod[method_name].text} - unit_coordinate  #{unit_coordinate} " if debug_YesNo == true		
			# Prüfe ist die Zelle leer?
			if is_cell_unsolved(unit_coordinate) == true
				puts "#{@myMethod[method_name].text} - Die Zelle ist leer " if debug_YesNo == true		
				error = @cell[unit_coordinate].delete_candidate(value, modified_by)
				sudoku_log(unit_coordinate, value, modified_by)
				puts @cell[unit_coordinate].print_cell if debug_YesNo == true	
				if error == false
					puts "ERROR #{@myMethod[method_name].text} - error  #{error} " if debug_YesNo == true		
				end		
			end
		end
	end
	
	
=begin
## Name 
			count_candidates_in_cell

## Was macht die Methode?
	Wieviele erlaubte Zahlen (Kandidaten) gib es in der Zelle?
	Return Array Anzahl der Zahlen und die Kandidaten als Cell_candidates

## access (Methode)
=end	
	def count_candidates_in_cell(coordinate)
		method_name = set_method("count_candidates_in_cell")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode		
		
		count = 0
		cell_candidates = get_candidates(coordinate)
		puts "#{method_name} - coordinate  #{coordinate} " if debug_YesNo == true	
		puts "#{method_name} - cell_candidates  #{cell_candidates} " if debug_YesNo == true	

		# Hash of get_candidates liefert eine 1 wenn es die Zahl gibt.
		cell_candidates.each { |key, value| count +=value if value.class == Fixnum }
		puts "#{method_name} - count  #{count} " if debug_YesNo == true	
		puts "#{method_name} - cell_candidates  #{cell_candidates} " if debug_YesNo == true	
		return [count, cell_candidates]
	end



=begin
## Name 
			delete_subset_in_unit

## Was macht die Methode?
	In einer Unit wird die Teilmenge/Subset aus den Kandidaten gelöscht
	Die Unit wird über unit_by_name ermittelt, die Subset_coordiantes werden daraus gelöscht.
	In allen Zellen der Restunit wird nun die Kandidatenliste um die subset_values gelöscht.
	Wird subset_values als Array übergeben, wird daraus ein Hash gemacht.
	
## access (Methode)
=end		
	def delete_subset_in_unit(subset_values, subset_coordinate, unit_by_name, modified_by)
		method_name = set_method("delete_subset_in_unit")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode		

		# Es wurde ein Array der subset_values übergeben, 
		# Umwandlung zum Hash nötig 
		if subset_values[0] != "g"
			a_subset = subset_values.clone
			# hole candidate von coordinate[0],
			subset_values = get_candidates(subset_coordinate[0])
			subset_values.each { |key, value| 
				if a_subset.include?(key) == true
					subset_values[key] =1
				else
					subset_values[key] = 0
				end
			}
		end	
		unit = Array.new
		unit = []
		# NEW
		# aus dem subset_coordiante versuchen reihe, spalte oder block abzuleiten
		unsolved_only = true
		get_coordinates(unit_by_name, subset_coordinate[0], unsolved_only).each { |coordinate| 
			if subset_coordinate.include?(coordinate) == false
				unit << coordinate
			end
			# in einem Paar sind 2 Zahlen darum muss die Schleife mehrmals laufen
			
			subset_values.each_key { |value|
				if subset_values[value] == 1
					puts "#{method_name} - value  #{value} " if debug_YesNo == true
					delete_candidates(unit, value, modified_by)
				end		
			}
		}
	end



=begin
## Name 
			set_subset_in_cells

## Was macht die Methode?
	Setze in die Zellen der Subset_coordinate die Werte subset_values
	Falls es sich um Hidden subsets handelt müssen die Kandidaten der Zelle angepaser werden
	
## access (Methode)
=end		
	def set_subset_in_cells(subset_values, subset_coordinate, modified_by)
		method_name = set_method("set_subset_in_cells")
		debug_YesNo = @myMethod[method_name].debug_YesNo
		# begin Methode		

		# subset_values ist ein Hash mit key = value und key 0 = "g"
		# Anderen falls wurde ein Array der subset_values übergeben, 
		# Umwandlung zum Hash nötig 
		if subset_values[0] != "g"
			a_subset = subset_values.clone
			# hole candidate von coordinate[0],
			subset_values = get_candidates(subset_coordinate[0])
			subset_values.each { |key, value| 
				if a_subset.include?(key) == true
					subset_values[key] =1
				else
					subset_values[key] = 0
				end
			}
			subset_values[0] = "g"
		end	
		# nun gibt es einen Hash mit key und Values
		# 	subset_values
		# Array mit den unit Koordinten
		#		subset_coordinate
		subset_coordinate.each { |coordinate| 
			puts "#{method_name} - subset_values #{subset_values}" if debug_YesNo == true
			@cell[coordinate].set_candidates(subset_values)
			subset_values.each { |key, value| sudoku_log(coordinate, key, "set by #{modified_by}") if value == 1}
		}
	end
	
end #end of class
