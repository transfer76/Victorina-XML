require 'rexml/document'

class Reader
  def self.read_from_xml
    questions_path = "#{__dir__}/../data/questions.xml"
    doc = File.open(questions_path) { |file| REXML::Document.new(file)}

    questions = []

    doc.elements.each('//question') do |item|

      answers = []
      right_answer = nil
      time = item.attributes['time'].to_i
      question = item.elements['text'][0].to_s

      item.elements.each('*/variant') do |answer|
        right_answer = answer.text if answer.attributes['right']
        answers << answer.text
      end

      questions << Question.new(
          time, question, answers, right_answer
      )
    end

    questions
  end
end
