require 'rails_helper'

describe Astronaut, type: :model do

  before :each do
    @astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @astronaut_2 = Astronaut.create!(name: 'Buzz Aldrin', age: 38, job: 'Engineer')
    @astronaut_3 = Astronaut.create!(name: 'Jeff Book', age: 42, job: 'Custodian')
    @mission_1 = @astronaut_1.missions.create!(title: "Capricorn 4", time_in_space: 55)
    @mission_2 = @astronaut_1.missions.create!(title: "Apollo 13", time_in_space: 22)
    @mission_3 = @astronaut_1.missions.create!(title: "Gemini 7", time_in_space: 3)
    @mission_4 = @astronaut_2.missions.create!(title: "Apollo 7", time_in_space: 34)
    @mission_5 = @astronaut_2.missions.create!(title: "Taurus 7", time_in_space: 32)
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    it ".average_age" do
      average = (37 + 38 + 42) / 3.0

      expect(Astronaut.average_age.round(2)).to eq(average.round(2))
    end
  end

  describe 'Instances Methods' do
    it ".sorted_missions" do
      expect(@astronaut_1.sorted_missions).to eq([@mission_2,@mission_1,@mission_3])
    end
  end
end
