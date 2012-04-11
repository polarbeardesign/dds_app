class Right < ActiveRecord::Base

  has_many :grants
  has_many :roles, :through => :grants
  OPERATION_MAPPINGS = {
    "new" => "CREATE",
    "create" => "CREATE",
    "edit" => "UPDATE",
    "update" => "UPDATE",
    "destroy" => "DELETE",
    "show" => "READ",
    "index" => "READ"
}

end
