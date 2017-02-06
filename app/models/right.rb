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
    "index" => "READ",
    "member_home" => "READ",
    "member_application" => "READ",
    "member_application_received" => "READ",
    "admin_home" => "READ",
    "members_list" => "READ",
    "photo_viewer" => "READ",
    "account" => "READ",
    "account_edit" => "UPDATE",
    "account_new" => "READ",
    "change_password" => "UPDATE",
    "signup" => "CREATE",
    "edit_signup" => "UPDATE",
    "edit_rsvp" => "UPDATE",
    "trip_financials" => "READ",
    "manifest" => "READ",
    "hold_harmless" => "READ",
    "frequent_flyers" => "READ",
    "frequent_flyer_detail" => "READ",
    "operations_2014" => "READ",
    "seventieth_birthday_party" => "READ",
    "arsenal_of_democracy" => "READ",
    "member_feed" => "READ",
    "diff" => "READ",
    "rollback" => "UPDATE",
    "membership" => "READ",
    "send_welcome_email" => "CREATE",
    "dues_reminder" => "CREATE",
    "all_events" => "READ",
    "thank_you" => "READ",
    "supportcaf" => "READ",
    "twelve_planes" => "READ",
    "living_history_flight_experience" => "READ",
    "SN_44_86758" => "READ",
    "terms" => "READ",
    "sort" => "UPDATE",
    "lhfe_flights" => "READ"
}

scope :ordered, order("rights.resource ASC")
scope :id_ordered, order("rights.id ASC")

scope :ordered_ops, :order => "field(operation,'CREATE','READ','UPDATE','DELETE')"

scope :unique_resources, :select => 'DISTINCT resource'

  def oper_resource
    "#{resource} #{operation}"
  end

end
