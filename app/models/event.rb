class Event < ActiveRecord::Base
	# attr_accessor :date_range
	# def all_day_event?
 #    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
 #    end
 	extend FriendlyId
	friendly_id :title, use: :slugged
 	belongs_to :employee
    has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  	def should_generate_new_friendly_id?
  		title_changed?
	end
end
