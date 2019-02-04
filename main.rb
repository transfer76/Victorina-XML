require_relative 'lib/question'
require_relative 'lib/reader'
require_relative 'lib/game'

game = Game.new(Reader.read_from_xml)

puts 'Let go! Answer the questions!'

until game.finished?

  puts "Time to answer #{game.timer} min"

  puts game.present_question.question

  puts game.present_question.answers

  user_input = STDIN.gets.capitalize.chomp

  game.check_answer(user_input)
end
