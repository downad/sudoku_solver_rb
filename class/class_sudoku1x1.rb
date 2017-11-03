class Sudoku1x1
#  attr_reader :coordiante, :row, :col, :block , :get_h_candidates
#	attr_writer :set_h_candidates, :delete_candidate

  def initialize(coordinate, row, col, block, value, given, solved, h_candidates)
    @coordinate = coordinate
		@row = row
		@col = col
		@block = block
		@value = value
		@b_given = given
		@b_solved = solved
		@b_given == true ? @solved_by = "Sudoku Given" : @solved_by = ""
		@h_candidates = Hash.new
		@h_candidates[0] = h_candidates #Hash [0] als Steuereinheit, ab 1 als Hash der Zahlen
		@a_modified_by = Array.new
		if @b_given == true 
			@a_modified_by << "Sudoku Given"
		end
  end

	def coordinate
		return @coordinate
	end

	def row
		return @row
	end

	def col
		return @col
	end

	def block
		return @block
	end

	def value
		return @value
	end

	def b_given
		return @b_given
	end

	def b_solved
		return @b_solved
	end

	def solved(number, string)
		@value = number
		@b_solved = true
		@solved_by = string
		@h_candidates[0] = "solved"
		@a_modified_by << "solved by #{string}"
		return true
	end
	
	def solved_by
		return @solved_by
	end

	def get_candidates
		return @h_candidates.clone
	end
	
	def set_candidates(candidates_in_cell)
		@h_candidates[0] = "g"
		candidates_in_cell.each do |key, value|
			@h_candidates[key] = value 
		end
	end

	def delete_candidate(value, modified_by)
		debug_YesNo = false
		returnvalue = true
		puts "delete_candidate - #{value} - #{modified_by} coordiante = #{coordinate}" if debug_YesNo == true
			if @h_candidates[0] == "g" 
				if @h_candidates[value] == 1
					puts "delete_candidate - #{value} - #{modified_by} " if debug_YesNo == true
					puts "delete_candidate -h_candidates =  #{@h_candidates} - value == #{value} " if debug_YesNo == true
					puts "delete_candidate -h_candidates =  #{@h_candidates[value]} == 1" if debug_YesNo == true
					@h_candidates.each { |key, candidate_value| puts "key = #{key} - Value = #{candidate_value}" } if debug_YesNo == true
					@h_candidates[value] = 0
					@a_modified_by << ["#{value} gelöscht durch #{modified_by}", value, modified_by]
				end
			else
				returnvalue = false
			end
		return returnvalue
	end
	
	def modified_by
		return @a_modified_by.clone
	end

	def print_cell
		returnstring = ""
		returnstring << "##########################################################################"
		returnstring << "\n Zelle(#{@coordinate}) - die Werte:"
		returnstring << "\n @coordinate - #{@coordinate}"
		returnstring << "\n @row - #{@row}"
		returnstring << "\n @col - #{@col}"
		returnstring << "\n @block - #{@block}"
		returnstring << "\n @value - #{@value}"
		returnstring << "\n @b_given - #{@b_given}"
		returnstring << "\n @b_solved - #{@b_solved}"
		returnstring << "\n @solved_by - #{@solved_by}"
		returnstring << "\n h_candidates[0] = n - erlaubte Zahlen müssen noch angelegt werden" if @h_candidates[0] == "n"
		returnstring << "\n h_candidates[0] = g - Die Liste der erlaubten Zahlen ist erstellt " if @h_candidates[0] == "g"
		returnstring << "\n h_candidates[0] = solved  - Die Zelle ist schon gelöst" if @h_candidates[0] == "solved"
		returnstring << "\n @h_candidates - #{@h_candidates}"
		returnstring << "\n @a_modified_by - #{@a_modified_by}"
		returnstring << "\n ##########################################################################"
		return returnstring 
	end
end
