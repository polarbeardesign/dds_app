class PostVersion < PaperTrail::Version

  self.table_name = :post_versions

# Don't need to track creates
  default_scope { where('event != "create"') }

end