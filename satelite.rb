require "gosu"
# require_relative "run"

# attr_accessor :x, :y, :x_vel, :y_vel, :mass, :image, :universe
class Satelite
	def initialize(x, y, x_vel, y_vel, mass, image, universe, center_x, center_y, center_mass)
		@universe = universe.to_i
		@x = (x / universe) * @width.to_f + @width.to_f/2
		@y = (y /universe) * @height.to_f + @height.to_f/2
		@x_vel = (x_vel/universe) * @width.to_f + @width.to_f/2
		@y_vel = (y_vel/universe) * @height.to_f + @height.to_f/2
		@image = Gosu::Image.new("images/#{image}")
		@mass = mass
		@center_mass = center_mass
	  @center_x = center_x
	  @center_y = center_y
		
	end

	def move
		distance_squared = (@x * @x) + (@y * @y)
		force =  6.674e-11 * (@center_mass * @mass) / distance_squared
		x_force = (@x/(@y + @x)) * force
		y_force = (@y/(@y + @x)) * force
		x_accel = x_force / @mass
		y_accel = y_force / @mass



		@x_vel = @x_vel + x_accel
		@y_vel = @y_vel + y_accel



		@x = @x - @center_x + @x_vel
		@y = @y - @center_y + @y_vel
	end

	def draw
		@image.draw_rot(@x, @y, 2, 0)
	end

end

