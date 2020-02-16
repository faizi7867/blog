require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:categories) do
    Category.new()
  end

  it 'name must be present' do
    categories.name = nil
    categories.description = "cheking" * 7
    expect(categories).not_to be_valid
  end

  it 'description must be present' do
    categories.name = "checking"
    categories.description = nil
    expect(categories).not_to be_valid
  end

  it 'name must be present' do
    categories.name = nil
    categories.description = nil
    expect(categories).not_to be_valid
  end

  it 'name must be present' do
    categories.name = "checking"
    categories.description = "checking" *7
    expect(categories).to be_valid
  end

  context "Validation" do

    before(:each) do
      @categories = Category.create!(name: 'check', description: 'checking'*7)
    end
  
    context 'creation' do
      it "should have one" do
        expect(Category.all.count).to eq(1)
      end
    end
  
    context 'Validation' do
      it "should not let a user to give nil name " do
        @categories.name = nil
        expect(@categories).to_not be_valid
      end
    end
  
    context 'Validation' do
      it "should not let a user to give nil description " do
        @categories.description = nil
        expect(@categories).to_not be_valid
      end
    end
  
    context ' for length and uniqueness' do
  
      it "should not let a user to enter more than 30 characters for name " do
        @categories.name = "j" * 31
        expect(@categories).to_not be_valid
      end
  
      it "should not let a user to enter less than 10 characters for description " do
        @categories.description = "j" * 9
        expect(@categories).to_not be_valid
      end
  
      it "should not let a user to enter more than 300 characters for description " do
        @categories.description = "j" * 301
        expect(@categories).to_not be_valid
      end
  
      it "should let a user to enter more than 50 characters and less than 300 character for description " do
        @categories.description = "j" * 51
        expect(@categories).to be_valid
      end
  
      it { should validate_uniqueness_of(:name) }
  
    end
    
  end



end