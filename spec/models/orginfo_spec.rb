require 'rails_helper'

RSpec.describe Orginfo, type: :model do
  it 'is valid with valid attributes' do
    orginfo = Orginfo.new(
      title: 'Example Title',
      description: 'Example Description'
    )
    expect(orginfo).to be_valid
  end

  it 'is not valid without a title' do
    orginfo = Orginfo.new(description: 'Example Description')
    expect(orginfo).not_to be_valid
  end

  it 'is not valid without a description' do
    orginfo = Orginfo.new(title: 'Example Title')
    expect(orginfo).not_to be_valid
  end
end
