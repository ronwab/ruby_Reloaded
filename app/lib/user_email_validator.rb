class UserEmailValidator < ActiveModel::Validator

  def validate(record)
  check_name =record.first_name
   record.errors[:users] << "Name is too short" if check_name.match?(/^\w{0,3}$/)
  end
end