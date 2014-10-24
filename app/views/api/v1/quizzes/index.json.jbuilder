json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :question
  json.url api_v1_quiz_url(quiz, format: :json)
end
