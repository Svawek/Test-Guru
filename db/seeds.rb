# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
Test.delete_all
Question.delete_all
Answer.delete_all
User.delete_all

categories = Category.create(
                         [{ title: 'Ruby'},
                         {title: 'Python'},
                         {title: 'Go'},
                         {title: 'JavaScript'}]
)

tests = Test.create(
      [{title: 'Ruby beginner',
                 level: 1,
                 category_id: 1},
                {title: 'Rails beginner',
                 level: 2,
                 category_id: 1},
                {title: 'Node.js',
                 level: 3,
                 category_id: 3},
                {title: 'Python beginner',
                 level: 1,
                 category_id: 2},
                {title: 'Go advanced',
                 level: 2,
                 category_id: 3}]
)

questions = Question.create(
                        [{body: 'How to create array?',
                         test_id: 1},
                        {body: 'How to create new app in Rails?',
                         test_id: 2},
                         {body: 'How to enable inspector',
                         test_id: 3},
                         {body: 'What files does the python language associate with?',
                         test_id: 4},
                        {body: 'How to run test?',
                        test_id: 5}]
)

answers = Answer.create(
                    [{question_id: 1,
                     text: 'Hash.new',
                     correct: false},
                     {question_id: 1,
                      text: '[]',
                      correct: true},
                     {question_id: 2,
                      text: 'rails create app',
                      correct: false},
                     {question_id: 2,
                      text: 'rails new app',
                      correct: true},
                     {question_id: 3,
                      text: 'node --inspect',
                      correct: true},
                     {question_id: 3,
                      text: 'node --ins',
                      correct: false},
                     {question_id: 4,
                      text: '*.pth',
                      correct: false},
                     {question_id: 4,
                      text: '*.py',
                      correct: true},
                     {question_id: 5,
                      text: 'go -test',
                      correct: true},
                     {question_id: 5,
                      text: 'go -inspect',
                      correct: true}]
)

users = User.create(
                [{name: 'user1',
                 passed_tests: '1 5'},
                 {name: 'user2',
                  passed_tests: '2 3 4'}]
)

p "Base created. Categories: #{Category.count}, Tests: #{Test.count}, Questions: #{Question.count}, Answers: #{Answer.count}, Users: #{User.count}"