class SafetyItemVersion < PaperTrail::Version

  self.table_name = :safety_item_versions

# Don't need to track creates
  default_scope { where('event != "create"') }

end