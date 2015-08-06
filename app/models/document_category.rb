class DocumentCategory < ActiveRecord::Base

  has_many :squadron_documents
  has_paper_trail
  
  scope :ordered, order("document_categories.category_name ASC")

end
