require 'spec_helper'

class TestModel
  include ActiveModel::Validations
  def initialize(attributes = {})
    @attributes = attributes
  end
  def read_attribute_for_validation(key)
    @attributes[key]
  end
end

class TV < TestModel
  validates :channels, :unique_nested => { :with => :number }
end

class Race < TestModel
  validates :runners, :unique_nested => true
end

class TVWithErrorMessage < TestModel
  validates :channels, :unique_nested => { :with => :number, :message => "must be different" }
end


describe UniqueNestedValidator do

  describe 'validation of uniqueness of nested attributes' do
    it 'should fails when attributes are the same' do
      expect(TV.new(:channels => [{number: "nine"}, {number: "nine"}])).not_to be_valid
    end
    it 'should not fail when attributes are different' do
      expect(TV.new(:channels => [{number: "eight"}, {number: "seven"}])).to be_valid
    end
  end

  describe 'validation of uniqueness of nested ids' do
    it 'should fails when nested ids are the same' do
      expect(Race.new(:runners => [{id: 4554}, {id: 4554}])).not_to be_valid
    end
    it 'should not fail when nested ids are different' do
      expect(Race.new(:runners => [{id: 6332}, {id: 990}])).to be_valid
    end
  end

  describe 'error messages' do
    it 'should be default when the message is not defined' do
      tv = TV.new(:channels => [{number: "ten"}, {number: "ten"}])
      tv.valid?
      expect(tv.errors.messages).to match({:channels => ["cannot repeat numbers"]})
    end
    it 'should be the provided message when it is defined' do
      tv = TVWithErrorMessage.new(:channels => [{number: "ten"}, {number: "ten"}])
      tv.valid?
      expect(tv.errors.messages).to match({:channels => ["must be different"]})
    end
  end

end
