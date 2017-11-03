class String
  # colorization
	# aus http://stackoverflow.com/questions/1489183/colorized-ruby-output
	# aufgerufen am 14.11.2016
  def colorize(color_code)
		# 0=normal, 1=fett, 4=unterstrichen, 5=blinkend, 7=invertiert.
    "\e[1;#{color_code}m#{self}\e[0m" #dick
#    "\e[#{color_code}m#{self}\e[0m"	#normal	
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end
