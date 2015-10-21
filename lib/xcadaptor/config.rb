require  'thor'

module Xcadaptor

  class Config < Thor 

    require_relative './project'

    desc 'ssl [options]' , "config ssl  according [options]"
    option :black ,:type => :array   , :banner => "ssl black domain" , :aliases => :b
    option :white ,:type => :array   , :banner => "ssl white domain" , :aliases => :w
    option :force ,:type => :boolean , :banner => "force cover" , :aliases => :f
    def ssl
      require_relative 'Config/ssl'
      Xcadaptor::ConfigModule::Sll.run options[:black] , options[:white] , options[:force]
    end

  end 

end
