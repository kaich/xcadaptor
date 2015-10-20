module Xcadaptor
  
  require_relative '../../project_method'

  class Bitcode 
    
    #main task 
    def self.run
      project =Xcadaptor::Project.new
      project.set_all_target_setting("ENABLE_BITCODE",false) do |target,key,value|
       deploy_version = project.get_target_setting(target,"IPHONEOS_DEPLOYMENT_TARGET") 
       debug_version = deploy_version['Debug'].to_f
       release_version = deploy_version['Release'].to_f
       if(debug_version < 6 || release_version  < 6)
          
          if project.get_target_setting(target,"ENABLE_BITCODE")["Debug"] == "YES"
            puts "-fembed-bitcode is not supported on versions of iOS prior to 6.0. Change bitcode NO\n"
            next true 
          end
       end

       next false 
      end
      
      project.save
    end

  end

end
