require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /astronauts" do

    before :each do
      @astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
      @astronaut_2 = Astronaut.create!(name: 'Buzz Aldrin', age: 38, job: 'Engineer')
      @astronaut_3 = Astronaut.create!(name: 'Jeff Book', age: 42, job: 'Custodian')
      @apollo_13 = Mission.create!(title: "Apollo 13", time_in_space: 55)
      @capricorn_4 = Mission.create!(title: "Capricorn 4", time_in_space: 55)
      @gemini_7 = Mission.create!(title: "Gemini 7", time_in_space: 55)
      @astronaut_1.missions << [@capricorn_4, @gemini_7, @apollo_13]
      @astronaut_2.missions << [@gemini_7, @capricorn_4]
      @astronaut_3.missions << [@capricorn_4, @apollo_13]

    end

    it "I see a list of astronauts info" do

      visit astronauts_path

      within("#astronaut-#{@astronaut_1.id}") do
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content("Age: #{@astronaut_1.age}")
        expect(page).to have_content("Job: #{@astronaut_1.job}")
      end

      within("#astronaut-#{@astronaut_2.id}") do
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content("Age: #{@astronaut_2.age}")
        expect(page).to have_content("Job: #{@astronaut_2.job}")
      end

      within("#astronaut-#{@astronaut_3.id}") do
        expect(page).to have_content(@astronaut_3.name)
        expect(page).to have_content("Age: #{@astronaut_3.age}")
        expect(page).to have_content("Job: #{@astronaut_3.job}")
      end
    end

    it "I see the average age of all astronauts" do

      visit astronauts_path

      expect(page).to have_content("Average Age: #{Astronaut.average_age}")
    end

    it "I see a list of the space missions" do

      visit astronauts_path

      within("#astronaut-#{@astronaut_1.id}") do
        expect(@apollo_13.title).to appear_before(@capricorn_4.title)
        expect(@capricorn_4.title).to appear_before(@gemini_7.title)
      end

      within("#astronaut-#{@astronaut_2.id}") do
        expect(@capricorn_4.title).to appear_before(@gemini_7.title)
      end

      within("#astronaut-#{@astronaut_3.id}") do
        expect(@apollo_13.title).to appear_before(@capricorn_4.title)
      end
    end
  end
end
