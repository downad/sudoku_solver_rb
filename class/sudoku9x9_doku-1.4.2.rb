class Suduku9x9 

	def set_method(method_name)
		if @myMethod.key?(method_name) == true 
			@myMethod[method_name].inc_counter
		else
			case method_name
		
			when "initialize"
			# "initialize"
				@myMethod[method_name] = SudokuMethods.new(method_name, "Initialisiere das Spiel", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.1 - 16.11.2016 INFO candidates in class-sudoku1x1 hinzugefügt.",
					"1.0.2 - 16.11.2016 INFO modified_by in class-Sudoku1x1 hinzugefügt.",
					"1.0.4 - 20.11.2016 INFO Klasse Sudoku9x9 in einzelne Dateien aufgeteilt.",
					"1.0.5 - 28.11.2016 INFO Klasse Method eingefügt.",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",]
				@myMethod[method_name].set_version(version)
				@myMethod[method_name].set_description("Initialisiere das Spiel, klassenweite Variablen werden definert.")
				@myMethod[method_name].set_arg("Keine Übergabewerte")
				@myMethod[method_name].set_return("Keine Return-Werte")
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",
				"@row - ein Hash mit key = Nummer der Reihe",
				"@col - ein Hash mit key = Nummer der Splate",
				"@block - ein Hash mit key = Nummer des Feldes",
				"@range_of_numbers - ein Array der erlaubten Zahlen",			]
			when "solvingsteps"
			# solvingsteps
				@myMethod[method_name] = SudokuMethods.new(method_name, "solvingsteps", false)
				version = [ "1.2.6 - 09.12.2016 NEW method solvingsteps",]
				@myMethod[method_name].set_version(version)
				@myMethod[method_name].set_description("Erzeuge einen Ausgabestring mit den Schritten zum Lösen des Sudoku ")
				@myMethod[method_name].set_arg("Keine Übergabewerte")
				@myMethod[method_name].set_return("string Return-Werte")
				class_var = [ "@solvingsteps (class Sudoku1x1) - Lösenungen, wird von init und set_cell_value gesetzt",	]
				@myMethod[method_name].set_class_var(class_var)
			when "print_grid"
			#	print_grid
				@myMethod[method_name] = SudokuMethods.new(method_name, "print_grid", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",]
				@myMethod[method_name].set_version(version)
				@myMethod[method_name].set_description("Erzeuge eine Ausgabe auf dem Bildschirm.")
				@myMethod[method_name].set_arg("Keine Übergabewerte")
				@myMethod[method_name].set_return("Keine Return-Werte")
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",
				"@range_of_numbers - ein Array der erlaubten Zahlen",	]
				@myMethod[method_name].set_class_var(class_var)
			when "get_sudoku_cells"
			# get_sudoku_cells
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_sudoku_cells", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.2.4 - 09.12.2016 INFO get_sudoku_cells umgestellt auf get_sudoku_cells(html_help = true)",			]
				@myMethod[method_name].set_version(version)
				set_description = ["Erzeuge einen Hash mit den Werten der Zellen.",
					"Zellenwert 0 = ungelöste Zelle,",
					" > 0 = gelöste Zelle,",
					" < 0 Zellen wurde bei Spielbeginn gesetzt..",			]
				@myMethod[method_name].set_description(set_description)
				set_arg = [ "bool html_help = true - es werden die Kandidten je Zelle angegeben.",]
				@myMethod[method_name].set_arg(set_arg)
				@myMethod[method_name].set_return("hash sudoku_cells - key = Koordinate. Ein String je Zelle.")
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",
				"@range_of_numbers - ein Array der erlaubten Zahlen",]
				@myMethod[method_name].set_class_var(class_var)		
			when "get_candidate"
			# get_candidate
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_candidate", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.1 - 16.11.2016 INFO candidates in class-sudoku1x1 hinzugefügt.",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Ermittle die Kandidaten der Zelle.",
					"Kandidaten sind die Zahlen, die in eine Zelle passen könnten",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.",]
				@myMethod[method_name].set_arg(set_arg)
				@myMethod[method_name].set_return("hash h_candidate - {1=>0, 2=>1,...} = ERLAUBT ist Zahl 2")
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",	]
				@myMethod[method_name].set_class_var(class_var)		
			when "get_values_in_rcb"
			# get_values_in_rcb
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_values_in_rcb", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.2.2 - 08.12.2016 INFO Loop in Methode get_values_in_rcb",	]
				@myMethod[method_name].set_version(version)
				set_description = ["Hole aus Reihe, Spalte und Block alle Zahlen/Value.",
					"Welche Zahlen/Value kommen in der gewälten unit vor?",	]
				@myMethod[method_name].set_description(set_description)
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.",			]
				@myMethod[method_name].set_arg(set_arg)
				@myMethod[method_name].set_return("hash values_rcb - {1=>0, 2=>1,..} = Zahlen in r, c, b sind  2")			
				class_var = [ "@range_of_numbers - ein Array der erlaubten Zahlen",			]
				@myMethod[method_name].set_class_var(class_var)
			when "get_values_in_unit"
			# get_values_in_unit
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_values_in_unit", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", 	]
				@myMethod[method_name].set_version(version)
				set_description = ["Schreibt die Zahlen der Unit in das Hash values.",
					"Welche Zahlen/Value kommen in der gewälten unit vor?",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "Array a_unit - Array mit den Koordinaten der Unit",	]
				@myMethod[method_name].set_arg(set_arg)
				@myMethod[method_name].set_return("Hash @values, key = Zahl, Value = 0 oder 1")			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",	]
				@myMethod[method_name].set_class_var(class_var)		
			when "get_coordinates"	
			# get_coordinates
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_coordinates", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.6 - 28.11.2016 INFO Flag unsolved_only hinzugefügt.",
					"1.0.9 - 30.11.2016 INFO umgestaltet aus get_block.",
					"1.0.14- 07.12.2016 BUGFIX	in get_coordinates.",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Hole einen Array mit den Koordinaten der Unit",
					"unsolved_only = true, es werden nur Koordinaten der ungelösten Zellen geliefert",
					"default unsolfed_only = false",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordinate - Kooridnate der Zelle.",
					"bool unsolved_only - nur ungelöste Zellen werden geliefert default = false.",	]
				@myMethod[method_name].set_arg(set_arg)
				@myMethod[method_name].set_return("a_unit Array - der Koordinaten des Feldes dieser Zelle.")			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",	]
				@myMethod[method_name].set_class_var(class_var)	
			when "get_rownumber"	
			# get_rownumber
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_rownumber", false)
				version = [ 
					"1.4.1 - 12.12.2016 NEW get_rownumber(coordinate),get_colnumber(coordinate)",
					"1.4.1 - 12.12.2016 NEW get_blocknumber(coordinate)", ]
				@myMethod[method_name].set_version(version)
				@myMethod[method_name].set_description("Hole die Reihennummer")			
				@myMethod[method_name].set_arg( "string coordinate - Kooridnate der Zelle.")
				@myMethod[method_name].set_return("int mit der Nummer")			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",	]
				@myMethod[method_name].set_class_var(class_var)
			when "get_colnumber"	
			# get_colnumber
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_colnumber", false)
				version = [ 
					"1.4.1 - 12.12.2016 NEW get_rownumber(coordinate),get_colnumber(coordinate)",
					"1.4.1 - 12.12.2016 NEW get_blocknumber(coordinate)", ]
				@myMethod[method_name].set_version(version)
				@myMethod[method_name].set_description("Hole die Spaltennummer")			
				@myMethod[method_name].set_arg( "string coordinate - Kooridnate der Zelle.")
				@myMethod[method_name].set_return("int mit der Nummer")			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",	]
				@myMethod[method_name].set_class_var(class_var)
			when "get_blocknumber"	
			# get_blocknumber
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_blocknumber", false)
				version = [ 
					"1.4.1 - 12.12.2016 NEW get_rownumber(coordinate),get_colnumber(coordinate)",
					"1.4.1 - 12.12.2016 NEW get_blocknumber(coordinate)", ]
				@myMethod[method_name].set_version(version)
				@myMethod[method_name].set_description("Hole die Blocknummer")			
				@myMethod[method_name].set_arg( "string coordinate - Kooridnate der Zelle.")
				@myMethod[method_name].set_return("int mit der Nummer")			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",	]
				@myMethod[method_name].set_class_var(class_var)					
			when "get_solved_by_text_of_cells"
			# get_solved_by_text_of_cells
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_solved_by_text_of_cells", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Erstellt eine Liste / String mit den solved_by-Werten der @cell.",
					"Welche Logic-Module wurden zum Lösen der Zellen verwendet?",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string sort allowed ['sortiert', 'unsortiert', 'modyfied_by']",
					"bool write_soved_by_text_to_file - Schreibe die Auswertung in eine Datei, default = false.",	]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "returnvalue -> Hash über alle Koordinaten",
					"oder returnstring -> String, vorstrukturiert",	]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",			]
				@myMethod[method_name].set_class_var(class_var)		
			when "is_grid_solved"
			# is_grid_solved
				@myMethod[method_name] = SudokuMethods.new(method_name, "is_grid_solved", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Prüft ob das Spiel gelöst wurde.",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "Kein Übergabewert"			]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "bool true, false -> Das Spiel wurde gelöst ",	]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "Keine Klassen-Variablen",			]
				@myMethod[method_name].set_class_var(class_var)		
		when "count_unsolved_cell"
			# count_unsolved_cell
				@myMethod[method_name] = SudokuMethods.new(method_name, "count_unsolved_cell", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Zählt die ungelösten Zellen.",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "Kein Übergabewert",]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "izahl -> Das Spiel hat noch izahl Zellen offen",]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "Keine Klassen-Variablen",	]
				@myMethod[method_name].set_class_var(class_var)		
			when "get_coordinates_of_unsolved_cell"
			# get_coordinates_of_unsolved_cell
				@myMethod[method_name] = SudokuMethods.new(method_name, "get_coordinates_of_unsolved_cell", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.2.3 - 08.12.2016 INFO Returnvalue in Methode get_coordinates_of_unsolved_cell auf Array geändert.", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Hole die Koordinaten aller Zellen des Grid, die ungelösten sind.",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "Kein Übergabewert",]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array mit den Koordianten der ungelösten Zellen.",]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",	]
				@myMethod[method_name].set_class_var(class_var)		
			when "is_coordinate_allowed"
			# is_coordinate_allowed
				@myMethod[method_name] = SudokuMethods.new(method_name, "Überprüfe die Koordinate.", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Überprüft ob ein Koordiante erlaubt ist.",
					"Coordinate hat einen @cell.key? Eintrag?.",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordinate - Kooridnate der Zelle.",			]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "bool false / true.",]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",			]
				@myMethod[method_name].set_class_var(class_var)		
			when "is_value_allowed"
			#	is_value_allowed
				@myMethod[method_name] = SudokuMethods.new(method_name, "Ist der Zahlenwert erlaubt?", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Überprüft ob eine Zahl erlaubt ist.",
					"Liefert @range_of_numbers.include? ein true?",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "int value - Zahl die getester werden solle.",]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "bool false / true.",]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@range_of_numbers - ein Array der erlaubten Zahlen",	]
				@myMethod[method_name].set_class_var(class_var)		
			when "is_cell_unsolved"
			# is_cell_unsolved
				@myMethod[method_name] = SudokuMethods.new(method_name, "is_cell_unsolved", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.7 - 28.11.2016 INFO Flag return_all hinzugefügt.",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Überprüfe ob die Zelle ungelöst ist. ",
					"is cell[].b_solved = true.",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordinate - Kooridnate der Zelle.",
					"bool return_all. Default = false, liefert nur true/fals zurück",
					"return_all = true, liefert einen Array [true/false, Text] zurück",	]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "bool false / true.",
					"oder Array [true/false, Text] ",	]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.",			]
				@myMethod[method_name].set_class_var(class_var)		
			when "set_cell_value"
			# set_cell_value
				@myMethod[method_name] = SudokuMethods.new(method_name, "set_cell_value", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.1 - 16.11.2016 INFO allowed_numbers in class-sudoku1x1 hinzugefügt",
					"1.0.2 - 16.11.2016 INFO modified_by in class-Sudoku1x1 hinzugefügt.",
					"1.0.3 - 16.11.2016 INFO delete_number_in_section hinzugefügt",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Setze die Zahl/Value in die Zelle.",
					"Prüfe dazu: Ist die Zelle leer?",
					"Ist die Koordinate erlaubt?",
					"Ist die Zahl/Value erlaubt?",
					"Ist diese Zahl an der gegebenen Zelle erlaubt?", ]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordinate - Kooridnate der Zelle.",
					"int value - die Zahl die eingetragen werden soll",
					"string solved_by_Logic - Welche Logic-Modul hat die Zelle gelöst", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "array returnvalue",	
					"	[0] false - Zahl geht nicht, true Zahl passt",
					"	[1] Text / Methoden Text",
					"	[2] Zahl die eingesetzt wurde",
					"	[3] Koordinate - der der Zelle.", ]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.", ]
				@myMethod[method_name].set_class_var(class_var)
			when "test_candidate_in_rcb"
			# test_candidate_in_rcb
				@myMethod[method_name] = SudokuMethods.new(method_name, "test_candidate_in_rcb", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.4.2 - 12.12.2016 MODIFY set_cell_value, ",
 					"				NEW test_candidate_in_rcb(candidate, coordinate)",
 					"				DELETE method is_value_allowed_in_rcb(candidate, coordinate)", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Ist die Zahlin der Reihe erlaubt?",
					"Ist die Zahlin der Spalte erlaubt?",
					"Ist die Zahlin im Block erlaubt?", ]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordinate - Kooridnate der Zelle.",
					"int value - Zahl die getestet werden soll", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "bool false / true", ]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "Keine Klassen-Variablen", ]
				@myMethod[method_name].set_class_var(class_var)
			when "delete_candidates"
			# delete_candidates
				@myMethod[method_name] = SudokuMethods.new(method_name, "delete_candidates", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.1 - 16.11.2016 INFO allowed_numbers in class-sudoku1x1 hinzugefügt",
					"1.0.2 - 16.11.2016 INFO modified_by in class-Sudoku1x1 hinzugefügt.",
					"1.0.3 - 16.11.2016 INFO delete_number_in_section hinzugefügt",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Lösche die Kandidaten der Unit.", ]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "array a_unit  - Array mit den Kooridnaten der Unit",
					"int value - Zahl die eingesetz werden soll",
					"string modified_by -	Logik die das Löschen veranlasst hat.", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Kein Retunrwert", ]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.", ]
				@myMethod[method_name].set_class_var(class_var)
			when "count_candidates_in_cell"
			# count_candidates_in_cell
				@myMethod[method_name] = SudokuMethods.new(method_name, "count_candidates_in_cell", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.12- 07.12.2016 NEW 	count_candidates_in_cell.",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Wieviele Kandidaten gibt es in der Zelle", ]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordinate - Kooridnate der Zelle.",			]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array mit der Anzahl der Kandidaten",
					"Hash mit den Kandidaten. Key = Zahl und true wenn es ein Kandidat ist.",	]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.", ]
				@myMethod[method_name].set_class_var(class_var)
			when "delete_subset_in_unit"
			# delete_subset_in_unit
				@myMethod[method_name] = SudokuMethods.new(method_name, "delete_subset_in_unit", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.16- 08.12.2016 NEW delete_subset_in_unit.",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["In einer Unit wird die Teilmenge/Subset aus den Kandidaten gelöscht",
					"Die Unit wird über unit_by_name ermittelt, die Subset_coordiantes werden daraus gelöscht.",		
					"In allen Zellen der Restunit wird nun die Kandidatenliste mittels subset_values geändert.",
					"Wird subset_values als Array übergeben, wird daraus ein Hash gemacht.", ]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "hash oder Array subset_values, hier stehen die zulöschenden Kandidaten",
					"Array subset_coordinate, Koordianten des Subset",
					"unit_by_name, row, col oder block",
					"modified_bystring.",			]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Kein Return-Wert",	]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "Keine Klassen-Variablen", ]
				@myMethod[method_name].set_class_var(class_var)
			when "set_subset_in_cells"
			# set_subset_in_cells
				@myMethod[method_name] = SudokuMethods.new(method_name, "set_subset_in_cells", false)
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.17- 08.12.2016 NEW set_subset_in_cells.",
					"1.2.0 - 08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Setze in die Zellen der Subset_coordinate die Werte subset_values.",
					"Falls es sich um Hidden subsets handelt müssen die Kandidaten der Zelle angepaser werden", ]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "hash oder Array subset_values, hier stehen die Kandidaten des Subset",
					"Array subset_coordinate, Koordianten des Subset",
					"modified_bystring.",			]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Kein Return-Wert",	]
				@myMethod[method_name].set_return(set_return)			
				class_var = [ "@cell (class Sudoku1x1) - Die Zelle, ein Hash, key = Koordinate.", ]
				@myMethod[method_name].set_class_var(class_var)
			
			# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
			# # # # #
			# # # # #					LOGIC-MODULE
			# # # # #
			# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
			when "naked_single"
				# naked_single
				# Lösungsstrategie 1
				@myMethod[method_name] = SudokuMethods.new(method_name, "Naked Single", false, "Single - Naked Single")
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.2 - 16.11.2016 INFO modified_by in class-Sudoku1x1 hinzugefügt.",
					"1.0.3 - 16.11.2016 INFO delete_number_in_section hinzugefügt",
					"1.0.10- 02.12.2016 INFO Naked Single angepasst.",
					"1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Erzeuge einen Hash mit den Werten der Zellen.",
					"Zellenwert 0 = ungelöste Zelle,",
					" > 0 = gelöste Zelle,",
					" < 0 Zellen wurde bei Spielbeginn gesetzt..", ]
				@myMethod[method_name].set_description(set_description)
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array RETURN",
					"array[0] -> false - kein Single / true - ein Single",
					"array[1]	-> Text",
					"array[2]	-> Zahl die gefunden wurde",
					"array[3]	-> Koordinate an der die Naked Single gefunden wurde.", ]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen", ]
				@myMethod[method_name].set_class_var(class_var)
			when "hidden_single"
				# hidden_single
				# Lösungsstrategie 2
				@myMethod[method_name] = SudokuMethods.new(method_name, "Hidden Single", false, "Single - Hidden Single")
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.2 - 16.11.2016 INFO modified_by in class-Sudoku1x1 hinzugefügt.",
					"1.0.3 - 16.11.2016 INFO delete_number_in_section hinzugefügt",
					"1.0.11- 02.12.2016 Hidden Single neu gemacht und angepasst.",
					"1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.2.5 - 09.12.2016 INFO hidden_single erweiter default wird Naked Single mitgelöst", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Erzeuge einen Hash mit den Werten der Zellen.",
					"Zellenwert 0 = ungelöste Zelle,",
					" > 0 = gelöste Zelle,",
					" < 0 Zellen wurde bei Spielbeginn gesetzt..", ]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array RETURN",
					"array[0] -> false - kein Single / true - ein Single",
					"array[1]	-> Text",
					"array[2]	-> Zahl die gefunden wurde",
					"array[3]	-> Koordinate an der der Single gefunden wurde.", ]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen", ]
				@myMethod[method_name].set_class_var(class_var)
			when "naked_pair"
				# naked_pair
				# Lösungsstrategie 3
				@myMethod[method_name] = SudokuMethods.new(method_name, "Naked Pair", false, "Subset - Naked Pair")
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.13- 07.12.2016 INFO	New Naked Pair.",
					"1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Versuche eine Untermenge zu suchen.",
					"Naked Pair bedeutet es gibt 2 Zellen in einer Unit, die die selben 2 Kandidaten haben." ]
				@myMethod[method_name].set_description(set_description)
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array RETURN",
					"array[0] -> false - kein Single / true - ein Single",
					"array[1]	-> Text",
					"array[2]	-> Zahl die gefunden wurde",
					"array[3]	-> Koordinate an der die Naked Single gefunden wurde.", ]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen", ]
				@myMethod[method_name].set_class_var(class_var)
			when "hidden_pair"
				# hidden_pair
				# Lösungsstrategie 4a
				@myMethod[method_name] = SudokuMethods.new(method_name, "Hidden Pair", false, "Subset - Hidden Pair")
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.15- 02.12.2016 INFO Hidden Pair neu gemacht und angepasst.",
					"1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Versuche eine versteckte Untermenge zu suchen.",
					"Hidden Pair bedeutet es gibt 2 Zellen in einer Unit, die die selben 2 Kandidaten haben.",
					"Sind die Hidden Pair gefunden müssen in den Hidden Pair Zelle alle Kandidaten gelöscht werden.", 
					"Ist die Zelle ungelöst? Gibt es mehr als 2 Kandidaten?",
					"Ja - Methode find_hidden_pair - Teste ob es ein weiters Paar gibt.",
					"	Return hidden_pair = [true, Hidden Pair gefunden, [Pair1, Pair2], [coordinate1, coordinate2]",	
					" Oder Nein - hidden_pair =  [false, Text, 0, 0/0]", ]
				@myMethod[method_name].set_description(set_description)
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array ",
					"array[0] -> bool true/false.",
					"array[1]	-> string Text.",
					"array[2]	-> Array mit den Zahl die gefunden wurden.",
					"array[3]	-> Array mit den Koordinate der Hidden Pair.", ]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen", ]
				@myMethod[method_name].set_class_var(class_var)
			when "find_hidden_pair"
				# find_hidden_pair gehört zu hidden_pair 
				# Lösungsstrategie 4b
				@myMethod[method_name] = SudokuMethods.new(method_name, "Hidden Pair", false, "Subset - Hidden Pair")
				version = [ "1.0.0 - 25.10.2016 Beginn von Ruby-Sudoku-Solver",
					"1.0.15- 02.12.2016 INFO Hidden Pair neu gemacht und angepasst.",
					"1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden", ]
				@myMethod[method_name].set_version(version)
				set_description = ["gehört zu hidden_pair",
					"Durchlaufe alle Unit, je Unit addiere alle Kandidaten.",
					"sind zwei Kandidaten nur 2 mal da, überprüfe ob si in den selben Zelle liegen.",
					"Falls ja, ist es ein Hidden Pair", ]
				@myMethod[method_name].set_description(set_description)
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.", ]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array ",
					"array[0] -> bool true/false.",
					"array[1]	-> string Text.",
					"array[2]	-> Array mit den Zahl die gefunden wurden.",
					"array[3]	-> Array mit den Koordinate der Hidden Pair.", ]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen", ]
				@myMethod[method_name].set_class_var(class_var)			
####################################################################################
####################################################################################
### Vervollständigen
####################################################################################
####################################################################################									
			when "line_block_interaction"
				# line_block_interaction
				# Lösungsstrategie 5a
				@myMethod[method_name] = SudokuMethods.new(method_name, "line_block_interaction", false, "Block Line Interaction")
				version = [ "1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.3.1	-	09.12.2016 NEW method block_line_interaction", ]
				@myMethod[method_name].set_version(version)
				set_description = ["Kann eine Zahl/Kandidat nur in Zellen eines Blockes vorkommen",
					"und diese Zellen sind in einer Linie,so kann er an keiner anderen Stelle des Blockes vorkommen.",
					"Hole Kandidaten aus der Coordinate.",
					"Hole unit row oder col.",
					"Teste Kandidaten in der gesamten unit.",
					"-> test_candidate_in(unit_by_name, candidate, coodinate) Return true/false",
					"Sind für alle Blöcke, außer Coordinate-Block false, dann ist es eine Line-Block-interaction.",
					"Lösche alle Zahlen/Kandidaten aus dem aktuellen Block (ohne Row/Col)",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.",	]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array ",
					"array[0] -> bool true/false.",
					"array[1]	-> string Text.",
					"array[2]	-> Array mit den Zahl die gefunden wurden.",
					"array[3]	-> Array mit den Koordinate.",			]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen",	]
				@myMethod[method_name].set_class_var(class_var)
			when "find_line_block_interaction"
				# line_block_interaction
				# Lösungsstrategie 5b
				@myMethod[method_name] = SudokuMethods.new(method_name, "find_line_block_interaction", false, "Block Line Interaction")
				version = [ "1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.3.1	-	09.12.2016 NEW method block_line_interaction", ]
				@myMethod[method_name].set_version(version)
				set_description = ["gehört zu line_block_interaction",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.",	]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array ",
					"array[0] -> bool true/false.",
					"array[1]	-> string Text.",
					"array[2]	-> Array mit den Zahl die gefunden wurden.",
					"array[3]	-> Array mit den Koordinate.",			]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen",	]
				@myMethod[method_name].set_class_var(class_var)
			when "xwing"
				# xwing
				# Lösungsstrategie 6a
				@myMethod[method_name] = SudokuMethods.new(method_name, "xwing", false, "X-Wing")
				version = [ "1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.4.0	-	12.12.2016 NEW method xwing", ]
				@myMethod[method_name].set_version(version)
				set_description = ["gehört zu ",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.",	]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array ",
					"array[0] -> bool true/false.",
					"array[1]	-> string Text.",
					"array[2]	-> Array mit den Zahl die gefunden wurden.",
					"array[3]	-> Array mit den Koordinate.",			]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen",	]
				@myMethod[method_name].set_class_var(class_var)
			when "find_xwing"
				# find_xwing
				# Lösungsstrategie 6b
				@myMethod[method_name] = SudokuMethods.new(method_name, "find_xwing", false, "X-Wing")
				version = [ "1.2.0 -	08.12.2016 NEW Versionsystem, Überprüfung aller Methoden",
					"1.4.0	-	12.12.2016 NEW method find_xwing", ]
				@myMethod[method_name].set_version(version)
				set_description = ["gehört zu xwing",	]
				@myMethod[method_name].set_description(set_description)			
				set_arg = [ "string coordiante - Dieser wird als Hash/key für die Zelle benutzt.",	]
				@myMethod[method_name].set_arg(set_arg)
				set_return = [ "Array ",
					"array[0] -> bool true/false.",
					"array[1]	-> string Text.",
					"array[2]	-> Array mit den Zahl die gefunden wurden.",
					"array[3]	-> Array mit den Koordinate.",			]
				@myMethod[method_name].set_return(set_return)
				class_var = [ "Keine Klassen-Variablen",	]
				@myMethod[method_name].set_class_var(class_var)		
		
			else # else case
			puts "method_name = #{method_name}"
			end
		end 
		return method_name
	end

# end class
end	


