require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'david', email: 'david@gmail.com', password: 'p', password_confirmation: 'p')
  end

  test "attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?, "name must not be empty"
    assert user.errors[:email].any?, "email must not be empty"
    assert user.errors[:password].any?, "password must not be empty"
  end

  test "password_confirmation must be same as password" do
    @user.password_confirmation = "anotherpassword"
    assert @user.invalid?
    assert_equal @user.errors[:password_confirmation], ["doesn't match Password"]
  end

  test "email must be unique" do
    #@user.save
    #user2 = @user
    #user2.save
    #assert_equal user2.errors[:email], @user.errors.full_messages
  end
end
