class BadgeAwardService

  def initialize(test_id, user)
    @current_test = Test.find(test_id)
    @all_passed_test = []
    @user = user
    find_all_passed_test
    @test_by_category = Test.by_category(@current_test.category.title)
    @test_by_level = Test.by_level(@current_test.level)
  end

  def pass_check?(badge)
    case badge.category
    when 'category'
      tests_include?(@test_by_category)
    when 'test'
      Test.all.include?(@current_test)
    when 'level'
      tests_include?(@test_by_level)
    else
      false
    end
  end

  def pass_all_check?(badge)
    tests_include?(Test.all)
  end

  def first_time_check?(badge)
    case badge.category
    when 'category'
      once_include?(@test_by_category)
    when 'test'
      @all_passed_test.count(@current_test) == 1
    when 'level'
      once_include?(@test_by_level)
    else
      false
    end
  end

  def find_all_passed_test
    @all_passed_test << @user.test_passages.each do |test_passage|
                          test_passage if test_passage.passed?
                        end
  end

  def tests_include?(tests)
    (tests - @all_passed_test).empty?
  end

  def once_include?(tests)
    tests.each do |test|
      return false if @user.test_passages.count(test) != 1
    end
    true
  end

  def add_badge_to_user(badge, test_passage)
    BadgeGetting.create(user_id: @user.id, badge_id: badge.id, test_passage_id: test_passage)
  end
end
