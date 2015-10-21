require 'thor'

module Xcadaptor
  
  require_relative  'xcadaptor/adapt'
  require_relative  'xcadaptor/config'

  class Command < Thor
    include Thor::Actions


    desc "adapt SUBCOMMAND", "manage  project adapt"
    subcommand "adapt", Xcadaptor::Adapt

    desc "config SUBCOMMAND", "config  project"
    subcommand "config", Xcadaptor::Config
  end


end
