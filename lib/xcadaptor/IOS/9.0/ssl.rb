module Xcadaptor

  require_relative '../../project_method'

  class Ssl

    def self.run
       project =Xcadaptor::Project.new 
       info_plist = project.info_plist
       info_plist['NSAppTransportSecurity'] = {NSAllowsArbitraryLoads: true}
       project.save
    end

  end

end
