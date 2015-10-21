module Xcadaptor 

  module ConfigModule

    class Sll

      #config ssl. wihte_domains is ssl. otherwise block_domains
      def self.run(black_domains = {},white_domains = {},is_force)
        project =Xcadaptor::Project.new 
        info_plist = project.info_plist
        ssl_key = "NSAppTransportSecurity"
        ssl_value = info_plist[ssl_key]
        if(ssl_value && !is_force)

          puts '[NSAppTransportSecurity] exsits. use --force to cover it'
        else

          domains_hash = {} 
          black_domains.each do |domain|
            domains_hash[domain] = self.exceptionDomains(true)
          end

          white_domains.each do |domain|
            domains_hash[domain] = self.exceptionDomains(false)
          end

          info_plist[ssl_key] = {
            "NSAllowsArbitraryLoads" => true,
            "NSExceptionDomains" => domains_hash
          }

          puts "config NSAppTransportSecurity finished"
          project.save
        end
      end


      def self.exceptionDomains(is_black)
       {
          NSExceptionMinimumTLSVersion: "TLSV1.2",
          NSExceptionRequiresForwardSecrecy: true,
          NSExceptionAllowsInsecureHTTPLoads: is_black,
          NSIncludesSubdomains: true,
        }
      end

    end


  end
  
end
