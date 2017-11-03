class Sudoku_log
  def initialize(sudoku_numbers = 9)
		@number = Hash.new
		1.upto(sudoku_numbers) { |key| @number[key] = Array.new }
		@solved = 0
  end
	
	def delete_candidate(value, modified_text)
		puts "#{value} - #{modified_text}"
		@number[value] << "delete by #{modified_text}" if @number[value].include?("delete by #{modified_text}") == false
	end

	def set_value(value, solved_text)
		@solved = value
		@number[value] << "#{solved_text}" 
	end

	def get_log
		returnvalue = ""
		@number.each { |key, value| 
		if @solved == key
			returnvalue << "\n#{key} #{value} - gelöst" if value.size > 0 
		else
			returnvalue << "\n#{key} #{value}" if value.size > 0 
		end
#			value.each { |text| returnvalue << "\n #{text}" } if value != ""
		}		
		return returnvalue
	end
	

end
