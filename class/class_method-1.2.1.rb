class SudokuMethods
=begin
## Name 			

## Version 
 V1.2.1 -	08.12.2016 NEW Versionsystem, Anpassungen an class_method.rb ->class_method-1.2.0.rb
 
## Was macht die Klasse?
	Die Klasse speichert alle Werte zu den Methoden
	dazu wird ein hMethod = Hash.new initialisiert.
 
## access (Methode)

## Debug Info

=end
	def initialize(name, text, debug_YesNo, solved_by = " - ")
		@name = name
		@text = text
		@debug_YesNo = debug_YesNo
		@solved_by = solved_by # Wird auch für modified_by verwendet
		@modified_by = solved_by 

		@version = Array.new
		@description = Array.new
		@arg = Array.new
		@return_arg = Array.new

		@class_var = Array.new

		@counter = 1

	end

	def set_version(s_text)
		if s_text.class == Array
			s_text.each { |s_text| @version << "#{s_text}" }
		else
			@version << "#{s_text}" 
		end
	end
	
	def set_description(s_text)
		if s_text.class == Array
			s_text.each { |s_text| @description << "#{s_text}" }
		else
			@description << "#{s_text}" 
		end
	end
	
	def set_arg(s_text)
		if s_text.class == Array
			s_text.each { |s_text| @arg << "#{s_text}" }
		else
			@arg << "#{s_text}" 
		end
	end
	
	def set_return(s_text)
		if s_text.class == Array
			s_text.each { |s_text| @return_arg << "#{s_text}" }
		else
			@return_arg << "#{s_text}" 
		end
	end



	def name
		return @name
	end

	def text
		return @text
	end

	def debug_YesNo
		return @debug_YesNo
	end

	def returnvalue
		return @returnvalue
	end

	def get_counter
		return @counter
	end
	
	def set_class_var(s_text)
		if s_text.class == Array
			s_text.each { |s_text| @class_var << "#{s_text}" }
		else
			@class_var << "#{s_text}" 
		end
	end

	def inc_counter
			@counter += 1
	end

	def solved_by
		return @solved_by
	end

	def modified_by
		return @modified_by
	end

	def print
		puts write_to_file
	end

	def write_to_file
		returnvalue = ""
		returnvalue << "\n**************************\n"
		returnvalue << "\nMethod-Name       = #{@name}"
		returnvalue << "\nVersion #{array_to_string(@version)}"
		returnvalue << "\nBeschreibung #{array_to_string(@description)}"
		returnvalue << "\nÜbergabewerte #{array_to_string(@arg)}" 
		returnvalue << "\nReturnwerte #{array_to_string(@return_arg)}"   

		returnvalue << "\nText zur Ausgabe  = #{@text}"
		returnvalue << "\n-Debugstatus      = #{@debug_YesNo}"
		returnvalue << "\n-Solved_by        = #{@solved_by}"
		returnvalue << "\n-Modified_by      = #{@modified_by}"
		returnvalue << "\n-Counter          = #{@counter}"
		returnvalue << "\nKlassenvariablen #{array_to_string(@class_var)}"
		returnvalue << "\n**************************\n"
		return returnvalue
	end

	def array_to_string(a_value)
		returnvalue = ""
		a_value.each { |value| returnvalue << "\n #{value}" }
		return returnvalue
	end



end #end of class
