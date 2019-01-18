# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all
User.destroy_all
OpenedTest.destroy_all

categories = Category.create(
                         [{ title: 'Ruby'},
                         {title: 'Python'},
                         {title: 'Go'},
                         {title: 'JavaScript'}]
)

tests = Test.create(
      [{title: 'Ruby beginner',
                 level: 1,
                 category_id: categories[0].id},
                {title: 'Rails beginner',
                 level: 2,
                 category_id: categories[0].id},
                {title: 'Node.js',
                 level: 3,
                 category_id: categories[3].id},
                {title: 'Python beginner',
                 level: 1,
                 category_id: categories[1].id},
                {title: 'Go advanced',
                 level: 2,
                 category_id: categories[2].id}]
)

questions = Question.create(
                        [{body: 'How to create array?',
                         test_id: tests[0].id},
                        {body: 'How to create new app in Rails?',
                         test_id: tests[1].id},
                         {body: 'How to enable inspector',
                         test_id: tests[2].id},
                         {body: 'What files does the python language associate with?',
                         test_id: tests[3].id},
                        {body: 'How to run test?',
                        test_id: tests[4].id}]
)

answers = Answer.create(
                    [{question_id: questions[0].id,
                     text: 'Hash.new',
                     correct: false},
                     {question_id: questions[0].id,
                      text: '[]',
                      correct: true},
                     {question_id: questions[1].id,
                      text: 'rails create app',
                      correct: false},
                     {question_id: questions[1].id,
                      text: 'rails new app',
                      correct: true},
                     {question_id: questions[2].id,
                      text: 'node --inspect',
                      correct: true},
                     {question_id: questions[2].id,
                      text: 'node --ins',
                      correct: false},
                     {question_id: questions[3].id,
                      text: '*.pth',
                      correct: false},
                     {question_id: questions[3].id,
                      text: '*.py',
                      correct: true},
                     {question_id: questions[4].id,
                      text: 'go -test',
                      correct: true},
                     {question_id: questions[4].id,
                      text: 'go -inspect',
                      correct: true}]
)

users = User.create(
                [{name: 'user1',
                 passed_tests: '1 5'},
                 {name: 'user2',
                  passed_tests: '2 3 4'}]
)

opened_tests = OpenedTest.create(
                             [{user_id: users[0].id,
                              test_id: tests[1].id,
                              test_passed: true},
                              {user_id: users[0].id,
                               test_id: tests[3].id,
                               test_passed: true},
                              {user_id: users[0].id,
                               test_id: tests[0].id,
                               test_opened: true},
                              {user_id: users[1].id,
                              test_id: tests[1].id,
                              test_opened: true},
                              {user_id: users[1].id,
                               test_id: tests[0].id,
                               test_passed: true}]
)

p "Base created. Categories: #{Category.count}, Tests: #{Test.count}, Questions: #{Question.count}, Answers: #{Answer.count}, Users: #{User.count}, Opened Tests: #{OpenedTest.count}"
