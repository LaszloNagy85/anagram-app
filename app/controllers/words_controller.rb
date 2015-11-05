get '/words' do
	@words = Word.all.to_a
	erb :"/words/index"
end