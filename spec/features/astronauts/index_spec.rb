require "rails_helper"

RSpec.describe "As a visitor", type: :feature do

  before :each do

  end

  describe "when I visit /astronauts" do
    it "I see a list of astronauts info" do
      astronaut = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')

      visit '/astronauts'

      expect(page).to have_content(astronaut.name)
      expect(page).to have_content(astronaut.age)
      expect(page).to have_content(astronaut.job)
    end

    it "I see the average age of all astronauts" do
      astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
      astronaut_2 = Astronaut.create!(name: 'Bob Armstrong', age: 31, job: 'Commander')

      visit '/astronauts'

      expect(Astronaut.average_age).to eq(34)
      expect(page).to have_content("Average Age: 34")
    end
  end
end
