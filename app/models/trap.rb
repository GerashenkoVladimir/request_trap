# == Schema Information
#
# Table name: traps
#
#  id   :integer          not null, primary key
#  name :string
#

class Trap < ApplicationRecord
  has_many :requests, dependent: destroy
  validates :name, presence: true
  validates :name, uniqueness: true
  validates_associated :requests
end
