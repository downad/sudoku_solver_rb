# Sudoku Solver with Ruby
# by Ralf Weinert
# ralf.weinert@gmx.de

class SudokuPath
	## Klasse zum erzeugen der require Pfade
	def initialize(my_global_path, game_path, class_path)
		@global_path = my_global_path
		@game_path = game_path
		@class_path =  class_path
	end

	def get_path(my_file)
		my_path = @global_path +  @game_path
		return my_path << my_file
	end

	def get_classpath(my_file)
		my_path = @global_path +  @class_path
		return my_path << my_file
	end
end

############################
##
##		Dateien nachladen
##
# Pfade zu den Dateien
my_global_path = "/home/ralf/workspace/downad_auf_github/sudoku_solver/"
game_path = "sudoku_solver/"
class_path = "sudoku_solver/class/"
@sudoku_class = Hash.new
@array_functions = Array.new
count = 0

# ladbarer Ruby-Code
array_functions = ["functions.rb", "strategien-1.3.0.rb"]
array_functions.each do |value|
	@sudoku_class[count] = SudokuPath.new(my_global_path, game_path, class_path)
	require @sudoku_class[0].get_path(value)
	count += 1
end
# ladbare Klassen
array_functions = [ 
	"class_method-1.2.1.rb",
	"class_string.rb", 
	"class_sudoku1x1.rb",
	"class_sudoku_log.rb",
	"class_unit.rb",
	"sudoku9x9_doku-1.4.2.rb", 
	"sudoku9x9_init-1.4.2.rb",
	"sudoku9x9_l_hp-1.2.0.rb",
	"sudoku9x9_l_hs-1.2.0.rb",
	"sudoku9x9_l_lbi-1.3.0.rb",
	"sudoku9x9_l_np-1.2.0.rb",
	"sudoku9x9_l_ns-1.2.0.rb",
	"sudoku9x9_l_xwing-1.4.0.rb",
]
array_functions.each do |value|
	@sudoku_class[count] = SudokuPath.new(my_global_path,  game_path, class_path)
	require @sudoku_class[0].get_classpath(value)
	count += 1
end

############################
##
##		Output - html-Datei, Pfad und Name
##
# Pfad und File-Name des Outputs-html
@htmlout_file = "/home/ralf/workspace/downad_auf_github/sudoku_solver/sudoku9x9.html"
@htmlout_file01 = "/home/ralf/workspace/downad_auf_github/sudoku_solver/sudoku9x9_methods.txt"


# Infos zu den Spielen
# Sudoku unlöbar
#	 , 1,  ,  ,  ,  ,  , 7, 8, 9,   ,   , 12, 13
# Sudoku lösbar mit hs, ns
#	0,  , 2, 3, 4, 5, 6,  ,  ,  , 10, 11,   ,

# Initialisiere 



############################
##
##	Anlegen des Spiel
##	Das Spiel muss fest eingetragen sein
##	TODO Abfrage "welches Spiel soll gespielt werden?
##
# game_play = 1 für Test mit naked_pair
# game_play = 15 für Test mit XWing
# game_play = 16 für Test mit XWing

game_play = 16 #MAXIMA 16

# solver => die Sudoku9x9 Klasse, mit den Funtionen und Variablen zum Lösen des Sudoku
@solver = Suduku9x9.new(get_sudoku_data(game_play))



puts "Initialisiere das Sudoku"
puts "Sudoku Nr. #{game_play} angelegt"

# print game 
puts @solver.print_grid 

# erzeuge ein html
make_html_output



## Zahl ist der Counter für die Ausgabe von XX - ser_coordinate[]....
zahl = 0
@zuege = Array.new

## Eingabe - was wurde eingegeben
tasteneingabe = ""
debug_method = false

allowed_key = ["x", "m", "s", "a"]
loop do
	#puts "Weiter: 'press a key'"
	#puts "a für automatisches Weiter"
	puts "m für manuelles Weiter"
	puts "s für Einstellungen"
	puts "a für automatisches Lösen"
	puts "x für Ende"
	tasteneingabe = gets.chomp
		break if allowed_key.include?(tasteneingabe) == true
	#	break if 
end

if tasteneingabe == "m" 
	puts manuelles_eintragen
end

# Ausgabe der gemachten Züge
@zuege.each { |zug| puts "#{zug}" }

# print game 
puts @solver.print_grid 

# Auswertung des Sudoku
puts "\n\n################################################################\n\n"
#		( Sortierung , show_methods)
a =  @solver.get_solved_by_text_of_cells("sortiert", true) #"modyfied_by") #"sortiert")
puts a
puts @solver.solvingsteps
puts "+++++++++++++++++++++++++++++++++"
puts @solver.print_sudoku_log

File.write(@htmlout_file01, a)

# erzeuge ein html
make_html_output

