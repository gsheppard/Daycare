class Nature < ActiveRecord::Base
  belongs_to :decreased_stat, class_name: 'Stat', foreign_key: 'id'
  belongs_to :increased_stat, class_name: 'Stat', foreign_key: 'id'
end
