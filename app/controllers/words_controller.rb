get '/words' do
	@words = Word.all.to_a
	erb :"/words/index"
end

get '/words/new' do
	erb :"words/new"
end

get '/words/:id' do
	id = Word.find(params[:id])
	@word = Word.find(id)
	erb :"/words/show"
end

post '/words' do
	word = Word.create(text: params[:text])
	redirect "/words/#{word.id}"
end