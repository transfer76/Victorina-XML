class Game
  attr_reader :questions, :right_answer, :time

  def initialize(questions)
    @questions = questions
    @current_index = 0
  end

  def present_question
    @questions[@current_index]
  end

  def right_answer?
    @right_answer = present_question.right_answer
  end

  def timer
    @time = present_question.time
  end

  def check_answer(user_input)
    puts 'Ok' if user_input == right_answer?
    puts "Wrong. Right answer is #{right_answer?}" if user_input != right_answer?

    @current_index += 1
  end

  def finished?
    @current_index >= @questions.size
  end
end
