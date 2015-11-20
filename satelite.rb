require "gosu"
# require_relative "run"

# attr_accessor :x, :y, :x_vel, :y_vel, :mass, :image, :universe
class Satelite
	def initialize(x_pos, y_pos, x_vel, y_vel, mass, image, universe)
		@univers = universe
		@x = (x_pos/@universe)*width + width/2
		@y = (y_pos/@universe)*height + height/2
		@x_vel = (x_vel/@universe)*width + width/2
		@y_vel = (y_vel/@universe)*height + height/2
		@image = Gosu::Image.new("images/#{image}.png")
		@mass = mass
		@angle = tan(@y/@x)
	end

	def move
		@angle = tan(@y/@x)
		@x_vel = @x_vel*(cos(@angle))
		@y_vel = @y_vel*(sin(@angle))



		@x = @x + @x_vel
		@y = @y + @y_vel
	end

	def draw
		@image.draw_rot(@x, @y, 2, 0)
	end

end

