class Contact < ApplicationRecord
  belongs_to :kind
  has_one :address
  has_one :phone

  accepts_nested_attributes_for :address, :phone, allow_destroy: true


end
