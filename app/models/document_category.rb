class DocumentCategory < ActiveRecord::Base

  has_many :squadron_documents

  scope :ordered, order("document_categories.category_name ASC")

end
