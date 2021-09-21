
set :stages, %w(production_dh production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'