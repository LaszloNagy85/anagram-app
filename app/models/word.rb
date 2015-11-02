class Word < ActiveRecord::Base
	before_create :add_letters
	
	def add_letters
		characters = self.text.chars
  		alphabetized_characters = characters.sort
  		self.letters = alphabetized_characters.join
  	end
	
	def self.find_anagrams(string)
	  letters = string.split(//)
	  @solutions = []
	  @anagrams = []

	  letters.each do |letter|
		remaining = letters.select { |l| l != letter }
		@solutions << letter + remaining.join('')
		@solutions << letter + reverse_letters(remaining).join('')
	  end
	  
	  @solutions.each do |solution|
	  	if Word.find_by_text(solution).present?
	  		@anagrams << solution
	  	end
	  end

	  @anagrams
	end
	
	def self.reverse_letters(letters)
		array_length = letters.length
		reversed_letters = Array.new(array_length)

		letters.each_with_index do |letter, index|
			reversed_letters[array_length - index - 1] = letter
		end
	
		return reversed_letters
	end
end