module Xcadaptor

 
  require 'pathname'
  require 'xcodeproj'

  class Project

    attr_reader :project
    attr_reader :targets
    attr_reader :info_plist_path
    attr_reader :info_plist

    def initialize(*args)
       get_project 
    end

    def targets
      @project.targets
    end

    def info_plist_path
      path = get_target_setting(project.targets[0],"INFOPLIST_FILE")["Debug"]
      path.gsub '$(SRCROOT)', Pathname.pwd.to_s
    end

    def info_plist 
      @info_plist = Xcodeproj::PlistHelper.read self.info_plist_path
    end

    # set project setting , block praram key , return bool value
    def set_project_setting(key,value)
      is_ok = true
      if block_given?
       is_ok = yield key
      end

      if is_ok
         config_list = @project.build_configuration_list
         config_list.set_setting key ,value
       end
    end

    # get project setting  
    def get_project_setting(key)
       config_list = @project.build_configuration_list
       config_list.get_setting key
    end 


    # set project setting , block praram target key , return bool value
    def set_target_setting(target,key,value)
      is_ok = true
      if block_given?
       is_ok = yield target, key
      end

       if is_ok
         target_config_list = target.build_configuration_list
         target_config_list.set_setting(key, value)
       end 
    end

    # get target setting 
    def get_target_setting(target, key)
       target_config_list = target.build_configuration_list
       target_config_list.get_setting key
    end


    # set project setting , block praram target key , return bool value
    def set_all_target_setting(key,value)
        is_ok = true

        config_list = @project.build_configuration_list
        project.targets.each do |target|
          if block_given? 
            is_ok = yield target , key 
          end
         
          if is_ok
            set_project_setting key ,value 
            set_target_setting target, key , value
          end
        end
    end

    # save your change 
    def save 
      @project.save
      if @info_plist
        Xcodeproj::PlistHelper.write @info_plist, self.info_plist_path 
      end 
    end

    private

    # get xcodeproj instance 
    def get_project
      current_dir = Pathname.pwd
      Dir.foreach(current_dir) do |filename| 
        if filename.include? 'xcodeproj'
          @project_path = "#{current_dir}/#{filename}"
          @project_name = File.basename(filename) 
          @project = Xcodeproj::Project.open @project_path 
          return project
        end
      end
    end

    
  end
    
end
