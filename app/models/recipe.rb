class Recipe < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	has_many :steps
	accepts_nested_attributes_for :steps,allow_destroy: true,
 						reject_if: proc { |attributes| attributes['step'].blank? }

end
