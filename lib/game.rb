class Game
  attr_reader :questions, :current_index

  def initialize(questions)
    @questions = questions
    @current_index = 0
  end

  def present_question
    @questions[@current_index]
  end

  def count
    @current_index += 1
  end

end