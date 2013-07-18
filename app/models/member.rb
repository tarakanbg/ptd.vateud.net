#encoding: utf-8
class Member < ActiveRecord::Base
  self.abstract_class = true

  establish_connection("api")

  set_table_name "members"

  attr_accessible :cid, :firstname, :lastname, :email, :rating, :pilot_rating, :humanized_atc_rating, :humanized_pilot_rating,
    :region, :country, :state, :division, :subdivision, :age_band, :experience, :reg_date, :susp_ends
end

