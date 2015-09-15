require 'rails_helper'

RSpec.describe Person, type: :model do
  it "is valid when height, weight, and gender are present" do
    expect(FactoryGirl.build(:person)).to be_valid
  end
  
  it "is invalid when height is not present" do
    expect(FactoryGirl.build(:person, height: '')).not_to be_valid
  end
  
  it "is invalid when weight is not present" do
    expect(FactoryGirl.build(:person, weight: '')).not_to be_valid
  end
  
  it "is invalid when gender is not present" do
    expect(FactoryGirl.build(:person, gender: '')).not_to be_valid
  end
end
