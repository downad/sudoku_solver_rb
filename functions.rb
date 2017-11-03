# functions
  def out_to_html(cells)
		# Cells ist ein Hash der Rwonumber mit Array der Col
		# erzeuge einen html-String für das File.html
		## Constanten für die html-Ausgabe
		html_headder = 
		"<html>\n
			 <head>\n
				<meta charset='UTF-8'>\n
				<meta http-equiv='refresh' content='3; URL=file:///home/ralf/Dokumente/ruby/sudoku9x9.html'>\n
				<title>Sudoku lösen mit ruby - html</title>\n
				<link href='design.css' type='text/css' rel='stylesheet'>\n
			 </head>\n
			 <body>\n"
		html_footer =
		"\n   </body>\n
		<html>\n"
		html_table ="<table style=\"font-family:'Courier'; text-align: center\">"
		html_table_end ="</table>"
		html_tr = "<tr>"
		html_tr_end = "</tr>"
		td = Array.new
		## Zelle mit 4 Rahmen und hellgrauem Hintergrund
		td[0] = "<td style=\"border:2px solid #000; background-color:grey\">"
		## 1. Spalte / 4. Spalte / 7. Spalte
		## Zelle mit dickem Border links und oben 
		td[1] = "<td style=\"border-left:2px solid #000; border-top:2px solid #000\">"
		## Zelle mit dickem Border links und dünnem oben und unten
		td[2] = "<td style=\"border-left:2px solid #000; border-top:1px solid #000; border-bottom:1px solid #000\">"
		## Zelle mit dickem Border links und unten
		td[3] = "<td style=\"border-left:2px solid #000; border-bottom:2px solid #000\">"
		## 2. Spalte / 5. Spalte / 8. Spatle
		## Zelle mit dickem Border dünnem links und rechts
		td[4] = "<td style=\"border-top:2px solid #000; border-left:1px solid #000; border-right:1px solid #000\">"
		## Zelle mit dünnem  Border 
		td[5] = "<td style=\"border:1px solid #000\">"
		## Zelle mit dickem Border unten, sowie dünnem oben 
		td[6] = "<td style=\"border-bottom:2px solid #000; border-left:1px solid #000; border-right:1px solid #000\">"
		## 3. Spalte / 6. Spalte / 9. Spalte
		## Zelle mit dickem Border rechts und oben 
		td[7] = "<td style=\"border-right:2px solid #000; border-top:2px solid #000\">"
		## Zelle mit dickem Border rechts und dünnem oben und unten
		td[8] = "<td style=\"border-right:2px solid #000; border-top:1px solid #000; border-bottom:1px solid #000\">"
		## Zelle mit dickem Border rechts und unten
		td[9] = "<td style=\"border-right:2px solid #000; border-bottom:2px solid #000\">"
		## 
		html_td_end = "</td>"
		# Matrix mit Rownumber und Colnumber  für die unterschiedlichen Formatierungen der Zellen
		html_td_matrix = [
		[td[0],td[0],td[0],td[0],td[0],td[0],td[0],td[0],td[0],td[0]],
		[td[0],td[1],td[4],td[7],td[1],td[4],td[7],td[1],td[4],td[7]],
		[td[0],td[2],td[5],td[8],td[2],td[5],td[8],td[2],td[5],td[8]],
		[td[0],td[3],td[6],td[9],td[3],td[6],td[9],td[3],td[6],td[9]],
		[td[0],td[1],td[4],td[7],td[1],td[4],td[7],td[1],td[4],td[7]],
		[td[0],td[2],td[5],td[8],td[2],td[5],td[8],td[2],td[5],td[8]],
		[td[0],td[3],td[6],td[9],td[3],td[6],td[9],td[3],td[6],td[9]],
		[td[0],td[1],td[4],td[7],td[1],td[4],td[7],td[1],td[4],td[7]],
		[td[0],td[2],td[5],td[8],td[2],td[5],td[8],td[2],td[5],td[8]],
		[td[0],td[3],td[6],td[9],td[3],td[6],td[9],td[3],td[6],td[9]],
		]

		# Über die Konstanten wird ein html-formatierter String erzeugt.
		# lege htmlout an und fülle mit Headder und Tabelle
		htmlout = ""
		htmlout << html_headder
		htmlout << html_table
		# Laufe über alle a_row und erzeuge eine Zeile in der Tabelle
		0.upto(9) do |rownumber|
			htmlout << html_tr
			# laufe über alle Spalten
			colnumber = 0
			cells[rownumber].each do |colvalue|
				#Cellhash = git die Koordinate des Zelle an
				#cellhash = "#{rownumber}/#{colnumber}"
				# Lege die Formatierung für die Zelle fest
				htmlout << html_td_matrix[rownumber][colnumber]
				# Kopfzeile rownumber == 0 
				# In Spalte 0 steht die Zeilennummer
				# alle Felder aber 1/1 bis 9/9 beinhalten die Zahlen des Soduko
				if rownumber == 0 	
					colnumber == 0 ? htmlout << "Sudoku 9x9" : htmlout << "Spalte #{colnumber}"
				else if colnumber == 0 	
					htmlout << "<br>Zeile #{rownumber}<br> <br>"
				end
					if colvalue.is_a? String #Array #Integer	
						htmlout << "#{colvalue}"
					else
						if colvalue > 0 and colnumber > 0 	
							htmlout << "<font color='blue'><b>#{colvalue}</b></font>"
						end
						if colvalue < 0 and colnumber > 0 	
							colvalue = (-1) * colvalue
							htmlout << "<font color='red'><b>#{colvalue}</b></font>"
						end
					end
				end
				# schließe die Zelle
				htmlout << html_td_end
				colnumber += 1
			end # end 0.upto(9) do |colnumber|
			htmlout << html_tr_end
		end # end 0.upto(9) do |rownumber|
		# beende die Tabelle und das html-file
		htmlout << html_table_end
		htmlout << html_footer
		return htmlout
  end 

  def print_sudoku(game)
	# erzeuge einen schnellen Print auf die Standards ausgabe
		puts "\n\n     1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 "
		puts "   |=========== =========== ==========="
    1.upto(9) do |rownumber|
      output = ""
 			1.upto(9) do |colnumber|
	  		cellhash = "#{rownumber}/#{colnumber}"
				if rownumber > 0 and colnumber > 0
					cellvalue = game[cellhash]
				end
				colnumber == 1 ? output << " Z#{rownumber}|" : output << "|"
#  			colnumber > 1 ? output << "" :  output << "|"
        cellvalue == 0 ? output << "   " : output << " #{cellvalue} " 
#			  output << "|"
      end
      puts output 
      rownumber % 3 == 0 ? puts("   |=========== =========== ===========") : puts("   |----------- ----------- -----------")
    end 
  end  

def get_sudoku_data(return_game)

	file =  "/home/ralf/Dokumente/ruby/sudoku/data/sudoku.gamedata.txt" 
	# Ein Muster Sudoku
	# Element 0 ist leeres Feld
		sudoku = Array.new
		sudoku[0] = [ [ ],
			[0,0,0,8,0,0,0,4,5],
			[4,6,0,0,0,0,0,0,1],
			[0,0,0,9,0,0,0,0,8],
			[0,7,0,0,3,0,5,0,0],
			[0,0,9,0,5,0,7,0,6],
			[0,0,0,0,2,0,3,0,0],
			[0,5,0,0,0,2,0,6,0],
			[0,4,0,0,0,6,8,2,0],
			[6,3,0,0,0,4,0,0,0],
		  ]
		sudoku[1] = [ [ ],
			[7,0,0,5,2,6,9,0,0],
			[0,0,0,4,3,0,0,0,0],
			[0,0,2,0,0,0,0,0,0],
			[0,0,0,3,0,0,0,0,8],
			[0,0,0,6,0,1,0,0,9],
			[0,0,6,0,0,8,0,5,0],
			[0,4,0,0,0,3,2,8,6],
			[9,2,0,0,6,4,0,0,5],
			[6,3,0,0,0,0,4,9,1],
		  ]
		sudoku[2] = [ [ ],
			[0,0,0,0,0,5,0,0,7],
			[0,0,0,7,0,0,4,0,8],
			[0,0,0,4,3,0,0,6,0],
			[0,0,5,2,0,0,0,0,0],
			[2,0,6,0,7,1,0,0,3],
			[8,0,0,6,0,3,0,0,0],
			[0,7,8,0,6,0,9,4,1],
			[0,6,0,5,0,0,0,0,2],
			[1,3,0,0,9,0,7,5,0],
		  ]


	sudoku_game = 2
	counter = 0

	File.open(file) do |f|
		f.each do |line|
	#    puts line
			if line.include?("9x9") == true
	#			puts "Anfang gefunden #{line}"
				counter = 0
				sudoku_game += 1
				sudoku[sudoku_game] = [[]]
	#			puts "Sudoku_game = #{sudoku_game} counter = #{counter}"
			end
			if  counter > 0 and counter < 10
				sudoku[sudoku_game] << line.chomp.split(",").map { |s| s.to_i }
				counter += 1
	#			puts "Sudoku_game = #{sudoku_game} counter = #{counter}"
			end
			if counter == 0 
				counter += 1
			end
		end
	end
#	puts "das ist ein Sudoku #{sudoku[2]}"
#	puts "das ist ein Sudoku #{sudoku[3]}"
	return sudoku[return_game]
end





#end
