json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :question, :answer
  json.url quiz_url(quiz, format: :json)
end
