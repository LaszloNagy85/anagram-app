get '/' do
	erb :index
end

get '/anagrams/:word' do
	@word = params[:word]
	word_array = @word.chars.sort
	@alphabetized_string = word_array.join
	@anagrams = Word.where("letters=?", @alphabetized_string)
	erb :show
end

def valid_input(input)
	if input.match(/^[a-zA-Z]+[a-zA-Z]$/)
		true
	else
		false
	end
end

post '/' do
	@word = params[:word]
	if valid_input(@word)
		redirect "/anagrams/#{@word}"
		erb :index
	else
		@error = "Words must contain only Latin letters." 
		erb :index
	end
end