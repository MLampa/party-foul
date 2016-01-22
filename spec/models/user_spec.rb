require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_valid(:username).when('bernie') }
  it { should_not have_valid(:username).when('', nil) }

  it { should have_valid(:email).when('user@example.com', 'bernie@cockapoo.com') }
  it { should_not have_valid(:email).when('', nil, 'bernie', '123.com') }

  it 'has matching password and password confirmation' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'thehillshaveyes'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
