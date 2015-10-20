require 'thor'

module Xcadaptor
  
  
  class Adapt < Thor
    include Thor::Actions
    
    desc "ios [version] [--category]" , "adapt xcode project to the verison ios"
    long_desc <<-LONGDESC
    adapt xcode project to the verison ios
    ios [version] [--category]
    version : ios version. eg: 9.0
    options:
    --category : category task, eg: 'bitcode' , 'ssl'

    LONGDESC
    option :category ,:type => :array   , :banner => "adapt category , in ios 9 eg: 'bitcode' 'ssl'"
    def ios(version)
      sub_command_file_path =  File.expand_path "#{File.dirname(__FILE__)}/IOS/#{version}"
      begin
        if require_all(sub_command_file_path)
          function_types = options[:category] 
          if function_types 
            #excute specified cateoty update
            function_types.each do |function_type|
              if File.exist? "#{sub_command_file_path}/#{function_type}.rb" 
                run_category function_type 
              else
                puts "#{function_type} not found\n"
              end
            end

          else 
            
            #excute all category update
            Dir.glob("#{sub_command_file_path}/*.rb").each do |f_path|
              pn = Pathname.new f_path
              file_name = pn.basename(".*").to_s
              run_category file_name 
            end

          end

        else 
          puts "ios version not found."
        end
      rescue => e 
        puts e.backtrace
      end 
    end


    private

    # require all file at path directory
    def require_all(path)
        begin
          Dir.glob("#{path}/*.rb").each do |f_path|
            require f_path
          end 
        rescue => e
          return false  
        end
        return true;
    end 


    # run category task  
    def run_category(category_name)
      class_name = "Xcadaptor::#{category_name.capitalize}"
      clazz = class_name.split('::').inject(Object) {|o,c| o.const_get c}
      clazz.run 
    end

  end



end
