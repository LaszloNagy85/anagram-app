get '/words' do
	@words = Word.all.to_a
	erb :"/words/index"
end

get '/words/new' do
	@word = Word.new
	erb :"words/new"
end

get '/words/:id' do
	id = Word.find(params[:id])
	@word = Word.find(id)
	erb :"/words/show"
end

post '/words' do
	@word = Word.create(text: params[:text].downcase)
	redirect "/words/#{@word.id}"
end

get '/words/:id/edit' do
	id = Word.find(params[:id])
	@word = Word.find(id)
	erb :"/words/edit"
end

put '/words/:id' do
	@word = Word.find(params[:id])
	@word.id = params[:id]
	@word.text = params[:text].downcase
	@word.save
	erb :"/words/show"
end

delete '/words/:id' do
    word = Word.find(params[:id])
    word.destroy
    redirect "/words"
  end