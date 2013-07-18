#encoding: utf-8
class Subdivision < ActiveRecord::Base

  self.abstract_class = true

  establish_connection("vateud")
  
  set_table_name "subdivisions"

  attr_accessible :code, :name, :website, :introtext
  

end
