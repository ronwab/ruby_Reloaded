require 'test_helper'

class PersonTest < ActiveSupport::TestCase
def setup
 @person= Person.create(name: "ron", age:37)
end
  test "Person should be valid" do
    assert @person.valid?
  end
 test "Person should have a name" do
   @person.name=("")
   assert_not @person.valid?
 end
  test "Age field should not be blank" do
    @person.age = ("")
    assert_not @person.valid?
  end
  test "Name should be atleast 3 charachters long" do
    @person.name="a"*2
    assert_not @person.valid?
  end
  test  "Name has atleast 3 characters" do
    @person.name="a"*4
    assert @person.valid?
  end
  test "age should allow only numeric values" do
    @person.age= 'ab'
    assert_not @person.valid?
  end
  test "age can be set to numeric values" do
    @person.age =12
    assert @person.valid?
  end

end
