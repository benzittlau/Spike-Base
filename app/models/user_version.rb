class UserVersion < VestalVersions::Version
  #idea, make the set_table_name polymorphic, have this one class for all models
  set_table_name :user_versions
end