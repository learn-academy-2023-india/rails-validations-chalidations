require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is not valid without a username' do
    hiro = Account.create(
      username: nil,
      password: '1234',
      email: 'hiro@gmail.com'
    )
    expect(hiro.errors[:username]).to_not be_empty
  end

  it 'is not valid without a password' do
    chantel = Account.create(
      username: 'hellochantel',
      password: nil,
      email: 'chantel@gmail.com'
    )
    expect(chantel.errors[:password]).to_not be_empty
  end

  it 'is not valid without a email' do
    charlean = Account.create(
      username: 'charchar',
      password: 'birthday month',
      email: nil
    )
    expect(charlean.errors[:email]).to_not be_empty
  end

  it 'is not valid if username is less than 5 characters' do
    mike = Account.create(
      username: 'mike',
      password: 'mikeynikey',
      email: 'mike@gmail.com'
    )
    expect(mike.errors[:username]).to_not be_empty
  end

  it 'does not allow duplicate usernames' do
    Account.create(
      username: 'ashley',
      password: '098765',
      email: 'ashley@gmail.com'
    )
    ashley = Account.create(
      username: 'ashley',
      password: '098765',
      email: 'ashley@gmail.com'
    )
    expect(ashley.errors[:username]).to_not be_empty
  end

  it 'is not valid if password is less than 6 characters' do
    sasha = Account.create(
      username: 'sasha',
      password: 'sash',
      email: 'sasha@gmail.com'
    )
    expect(sasha.errors[:password]).to_not be_empty
  end

  it 'does not allow duplicate password' do
    Account.create(
      username: 'victor',
      password: 'helloo',
      email: 'victor@gmail.com'
    )
    victor = Account.create(
      username: 'victor',
      password: 'helloo',
      email: 'victor@gmail.com'
    )
    expect(victor.errors[:password]).to_not be_empty
  end
end
