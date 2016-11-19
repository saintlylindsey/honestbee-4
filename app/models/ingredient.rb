class Ingredient < ApplicationRecord

	require 'csv'

	csv_text = File.read(Rails.root.join('lib', 'seeds', 'lstIngredients.csv'))
	csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
	csv.each do |row|
		t=Ingredient.new
		t.name=row['Name']
		t.i_id=row['I_ID']
		t.save
	end

end

# https://gist.github.com/arjunvenkat/1115bc41bf395a162084