class Word
	def self.find_anagrams(string)
	  # Convert word to an array of letters
	  letters = string.split(//)

	  # Create an array to store our anagrams
	  @anagrams = []

	  # Loop through each letter in letters
	  letters.each do |letter|
		# Select the remaining letters
		remaining = letters.select { |l| l != letter }

		# Create a new word by combining the letter + the remaining letters
		# Add new word to anagrams array
		@anagrams << letter + remaining.join('')

		# Create a new word by combining the letter + the reverse of the remaining letters
		# Add new word to anagrams array
		@anagrams << letter + reverse_letters(remaining).join('')
	  end

	  # Return anagrams array
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