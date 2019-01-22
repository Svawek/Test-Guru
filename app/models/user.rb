class User < ApplicationRecord
  def opened_and_passed_tests(value)
    Test.joins("JOIN opened_tests ON tests.id = opened_tests.test_id").where(opened_tests: { user_id: id }).where(level: value)
  end

end
