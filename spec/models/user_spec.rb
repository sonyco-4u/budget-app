require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.create!(name: 'someone', email: 'user@user.com', password: 'password', id: 1)
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with any empty attribute' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should have a correct value' do
    expect(subject.name).to eql 'someone'
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'email should have a correct value' do
    expect(subject.email).to eql 'user@user.com'
  end
end
