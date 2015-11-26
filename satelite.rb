require "gosu"
# require_relative "run"

# attr_accessor :x, :y, :x_vel, :y_vel, :mass, :image, :universe
class Satelite
	def initialize(x, y, x_vel, y_vel, mass, image, universe, center_x, center_y, center_mass)
		@width = 480
		@height = 480
		@universe = universe.to_f
		@true_x = x
		@true_y = y
		@x = (x.to_f/@universe) * 240 + 240
		@y = (y.to_f/@universe) * 240 + 240
		@x_vel = (x_vel.to_f / @universe.to_i) * @width.to_f 
		@y_vel = (@height.to_f  / @universe.to_i) * y_vel.to_f
		@image_1 = image
		@image = Gosu::Image.new("images/#{image}")
		@mass = mass
		@center_mass = center_mass
	    @center_x = center_x + 240
	    @center_y = center_y + 240
		
	end

	def move

		distance_squared = (@true_x * @true_x) + (@true_y * @true_y)
		force =  6.674e-11 * (@center_mass * @mass) / distance_squared
		x_force = (@x / (@y + @x)) * force
		y_force = (@y / (@y + @x)) * force
		x_accel = x_force.to_f / @mass
		y_accel = y_force.to_f / @mass


		if @x >= 240
			x_accel = -1 * x_accel.to_f
		end

		if @y >= 240
			y_accel = -1 * y_accel.to_f
		end
		


		@x_vel = @x_vel + x_accel
		@y_vel = @y_vel + y_accel
		



		@x += @x_vel
		@y += @y_vel


	end

	def draw
		if @image_1 == "sun.png"
			@image.draw( 240, 240, 2)
		else
			@image.draw(@x, @y, 2)
		end
		
	end

end

