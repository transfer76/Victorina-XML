require_relative 'lib/question'
require_relative 'lib/reader'
require_relative 'lib/game'

game = Game.new(Reader.read_from_xml)

puts 'Let\'s go! Answer the questions!'

until game.finished?

  puts "Time to answer #{game.timer} min"
  puts

  puts game.ask_question

  game.show_variants

  user_input = STDIN.gets.to_i

  game.check_answer(user_input)
end

puts "Total questions is #{game.questions.size}\nYour correct answers #{game.count}"
