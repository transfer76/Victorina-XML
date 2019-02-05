class Game
  attr_reader :questions, :count

  def initialize(questions)
    @questions = questions
    @current_index = 0
    @count = 0
  end

  def present_question
    @questions[@current_index]
  end

  def timer
    present_question.time
  end

  def ask_question
    present_question.question
  end

  def show_variants
    present_question.answers.each.with_index { |answer, i| puts "#{i + 1}.#{answer}" }
  end

  def right_answer
    present_question.right_answer
  end


  def check_answer(user_input)
    if present_question.answers[user_input - 1] == right_answer
      puts 'Ok'
      @count += 1
    else
      puts "Wrong. Right answer is #{right_answer}"
    end

    @current_index += 1
  end

  def finished?
    @current_index >= @questions.size
  end
end
