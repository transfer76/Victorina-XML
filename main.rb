require_relative 'lib/question'
require_relative 'lib/reader'
require_relative 'lib/game'

game = Game.new(Reader.read_from_xml)

puts 'Let go! Answer the questions!'

while game.current_index < game.questions.size

  puts "Time to answer #{game.present_question.time} min"

  puts game.present_question.question

  puts game.present_question.answers

  user_input = STDIN.gets.capitalize.chomp

  right_answer = game.present_question.right_answer

  if user_input == right_answer
    puts "Ok"
  else
    puts "Wrong. Right answer is #{right_answer}"
  end

  game.count
end
