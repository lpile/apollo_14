class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @average_age = Astronaut.average_age
  end
end
