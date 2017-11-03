class Unit
  def initialize(coordinate)
		@a_unit = Array.new
		@a_unit << coordinate
  end
	
	def set(value)
		@a_unit << value
	end

	def get
		return @a_unit.clone
	end

end
