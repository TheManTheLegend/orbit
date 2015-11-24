require "gosu"
require_relative "satelite"

class GameWindow < Gosu::Window
	def initialize
		super 480, 480
		@planets = []
		@width = 480
		@height = 480

		file = File.open("planets.txt", "r")
		
		file.each_with_index do |line, index| 
			if index == 0 
				bodies = line.to_f
			elsif index == 1
				@universe = line.to_f
			elsif index > 7

			else
	      x, y, x_vel, y_vel, mass, image = line.strip.split(' ') 
	      if x_vel == 0 && y_vel == 0
	      	@center_mass = mass
	      	@center_x = x
	      	@center_y = y
	      end
	      @planets.push(Satelite.new(x.to_f, y.to_f, x_vel.to_f, y_vel.to_f, mass.to_f, image, @universe.to_f, @center_x.to_f, @center_y.to_f, @center_mass.to_f))
	      
	    end
	    (0..@planets.length).each do |index|
	    	if @planets[index] = "nil"
	    		puts "found nil"
	    		@planets[index].pop
	    		@planets[index].push(0)
	    	end
	    end
	  end

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