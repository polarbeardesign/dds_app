class SquadronDocument < ActiveRecord::Base

  belongs_to :document_category

  scope :category_ordered, joins(:document_category).merge(DocumentCategory.ordered)
  scope :ordered, order("squadron_documents.title ASC")

end
