class BadgeAwardService

  def initialize(test_passage)
    @test_passage = test_passage
    check_badges
    # @all_passed_test = []
    # @user = user
    # find_all_passed_test
    # @test_by_category = Test.by_category(@current_test.category.title)
    # @test_by_level = Test.by_level(@current_test.level)
  end

  def check_badges
    Badge.all.each do |badge|
      if send("#{badge.condition}_check?", badge)
        add_badge_to_user(badge)
      end
    end
  end

  def add_badge_to_user(badge)
    UsersBadge.create(user_id: @test_passage.user.id, badge_id: badge.id, test_passage_id: @test_passage.id)
  end

  private

  def pass_check?(badge)
    test_by_category = Test.by_category(@test_passage.test.category.title)
    test_by_level = Test.by_level(@test_passage.test.level)
    case badge.category
    when 'category'
      tests_include?(test_by_category)
    when 'test'
      Test.all.include?(@test_passage.test)
    when 'level'
      tests_include?(test_by_level)
    else
      false
    end
  end

  def pass_all_check?(badge)
    tests_include?(Test.all)
  end

  def first_time_check?(badge)
    test_by_category = Test.by_category(@test_passage.test.category.title)
    test_by_level = Test.by_level(@test_passage.test.level)
    case badge.category
    when 'category'
      once_include?(test_by_category)
    when 'test'
      find_all_passed_test
      @all_passed_test.count(@test_passage.test) == 1
    when 'level'
      once_include?(test_by_level)
    else
      false
    end
  end

  def find_all_passed_test
    @all_passed_test = []
    @all_passed_test << @test_passage.user.test_passages.each do |test_passage|
                          test_passage if test_passage.passed?
                        end
  end

  def tests_include?(tests)
    find_all_passed_test
    (tests - @all_passed_test).empty?
  end

  def once_include?(tests)
    tests.each do |test|
      return false if @test_passage.user.test_passages.count(test) != 1
    end
    true
  end
end
