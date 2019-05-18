class Purchproditemgst < ApplicationRecord
  belongs_to :productpurchasegst, optional: true
  #belongs_to :igst1, :foreign_key => 'igst_1', :class_name => 'Taxrate'
  #belongs_to :cgst2, :foreign_key => 'cgst_2', :class_name => 'Taxrate'
  #belongs_to :sgst3, :foreign_key => 'sgst_3', :class_name => 'Taxrate'
end
