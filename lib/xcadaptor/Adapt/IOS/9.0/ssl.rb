module Xcadaptor

  require_relative '../../../project'

  module AdaptModule
    module IOS9Module

        class Ssl

          def self.run
             project =Xcadaptor::Project.new 
             info_plist = project.info_plist
             ssl_key = info_plist['NSAppTransportSecurity']
             if !ssl_key
               info_plist['NSAppTransportSecurity'] = {NSAllowsArbitraryLoads: true}
               puts "add [NSAppTransportSecurity] in plist\n"
               project.save
             end
          end

        end

    end 
  end 

end
