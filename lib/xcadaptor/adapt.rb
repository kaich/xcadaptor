require 'thor'

module Xcadaptor
  
  
  class Adapt < Thor
    include Thor::Actions
    
    desc "adapt ios" , "adapt ios xcode project update"
    option :category ,:type => :array   
    def ios(version)
      sub_command_file_path =  File.expand_path "#{File.dirname(__FILE__)}/IOS/#{version}"
      begin
        if require_all(sub_command_file_path)
          function_types = options[:category] 
          function_types.each do |function_type|
            if File.exist? "#{sub_command_file_path}/#{function_type}.rb" 
              calss_name = "Xcadaptor::#{function_type.capitalize}"
              clazz = "Xcadaptor::#{function_type.capitalize}".split('::').inject(Object) {|o,c| o.const_get c}
              clazz.run 
            else
              puts "#{function_type} not found\n"
            end
          end
        else 
          puts "ios version not found."
        end
      rescue => e 
        puts e
      end 
    end


    private

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

  end



end
