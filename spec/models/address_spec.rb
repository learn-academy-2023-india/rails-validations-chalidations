require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is not valid without a street number' do
    first = Address.create(
      street_number: nil,
      street_name: 'Beverly Hills Drive',
      city: 'Beverly Hills',
      state: 'CA',
      zip: 90210
    )
    expect(first.errors[:street_number]).to_not be_empty
  end

  it 'is not valid without a street name' do
    second = Address.create(
      street_number: 12,
      street_name: nil,
      city: 'Beverly Hills',
      state: 'CA',
      zip: 90210
    )
    expect(second.errors[:street_name]).to_not be_empty
  end

  it 'is not valid without a city' do
    third = Address.create(
      street_number: 12,
      street_name: 'Beverly Hill Drive',
      city: nil,
      state: 'CA',
      zip: 90210
    )
    expect(third.errors[:city]).to_not be_empty
  end

  it 'is not valid without a state' do
    fourth = Address.create(
      street_number: 12,
      street_name: 'Beverly Hill Drive',
      city: 'Beverly Hills',
      state: nil,
      zip: 90210
    )
    expect(fourth.errors[:state]).to_not be_empty
  end

  it 'is not valid without a zip' do
    fifth = Address.create(
      street_number: 12,
      street_name: 'Beverly Hill Drive',
      city: 'Beverly Hills',
      state: 'CA',
      zip: nil
    )
    expect(fifth.errors[:zip]).to_not be_empty
  end
end
