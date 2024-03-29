class Word < ActiveRecord::Base
	before_save :add_letters
	
	def add_letters
		characters = self.text.chars
  		alphabetized_characters = characters.sort
  		self.letters = alphabetized_characters.join
  	end
end