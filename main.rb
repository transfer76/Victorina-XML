require 'rexml/document'

questions_path = "#{__dir__}/data/questions.xml"
doc = File.open(questions_path) { |file| REXML::Document.new(file)}

current_index = 0

questions = []
answers = []
right_answers = []
time_answer = []

doc.elements.each('//text') do |item|
  questions << item.text
end

doc.elements.each('///variant') do |item|
  answers << item.text
end

doc.elements.each('///variant[@right]') do |item|
  right_answers << item.text
end

doc.elements.each('questions/question') do |item|
  time_answer << item.attributes['time']
end

puts 'Let go! Answer the questions!'

while current_index < questions.size
  puts questions[current_index]

  answers.slice!(0..3).each_with_index{ |item, i| puts "#{i + 1} #{item}"}

  puts "Time to answer #{time_answer[current_index]} min"

  user_answer = STDIN.gets.capitalize.chomp

  correct_answer = right_answers[current_index]

  if user_answer == correct_answer
    puts 'Ok'
  else
    puts "Not Ok. Right answer #{correct_answer}"
  end

  current_index += 1
end
