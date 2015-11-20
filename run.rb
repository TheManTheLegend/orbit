require "gosu"
require_relative "satelite"

class GameWindow < Gosu::Window
	def initialize
		super 480, 480
		@planets = []

		file = File.open("planets.txt", "r", '\r')
		
		file.each_with_index do |line, index| 
			if index == 0 
				bodies = line.to_i
			elsif index == 1
				universe = line.to_i
			else
	      x, y, x_vel, y_vel, mass, image = line.strip.split(' ') 
	      @planets = Satelite.new(:x => x, :y => y, :x_vel => x_vel,
	      	:y_vel => y_vel, :mass => mass, :image => image,
	      	:universe => universe)
	      @planets.save
	    end
	  end
		# file = File.open("planets.txt", 'r')
		# file.each_line_with_index do |line, index|
		# 	if index == 0 
		# 		@bodies = line.to_i
		# 	elsif index == 1
		# 		@universe = line.to_i
		# 	else
		# 		array = line.split(" ")
		# 		@planets.push(Satelite.new(array[0].to_i, array[1].to_i, array[2].to_i, array[3].to_i, array[4].to_i, array[5].to_s, @universe))
		# 	end
		# end

		@background_image = Gosu::Image.new("images/starmap.jpg", :tileable => true)

	end

	def update
		(0..@planets.length).each do |index|
			@planets[index].move
		end
	end

	def draw
		(0..@planets.length).each do |index|
			@planets[index].draw
		end
		
		@background_image.draw(0, 0, 1)
	end



end

window = GameWindow.new
window.show