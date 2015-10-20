require 'thor'

module Xcadaptor
  
  require_relative  'xcadaptor/adapt'

  class Command < Thor
    include Thor::Actions


    desc "adapt SUBCOMMAND", "manage  project adapt"
    subcommand "adapt", Xcadaptor::Adapt
  end


end
