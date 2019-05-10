require "rails_helper"

RSpec.describe "As a visitor", type: :feature do

  before :each do

  end

  describe "when I visit /astronauts" do
    it "I see a list of astronauts info" do
      astronaut = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')

      visit astronauts_path

      expect(page).to have_content(astronaut.name)
      expect(page).to have_content(astronaut.age)
      expect(page).to have_content(astronaut.job)
    end
  end
end
