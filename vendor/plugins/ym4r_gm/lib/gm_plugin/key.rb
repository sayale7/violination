module Ym4r
  module GmPlugin
    class GMapsAPIKeyConfigFileNotFoundException < StandardError
    end
        
    class AmbiguousGMapsAPIKeyException < StandardError
    end
    
    #Class fo the manipulation of the API key
    class ApiKey
      #Read the API key config for the current ENV
      unless File.exist?(RAILS_ROOT + '/config/gmaps_api_key.yml')
        raise GMapsAPIKeyConfigFileNotFoundException.new("File RAILS_ROOT/config/gmaps_api_key.yml not found")
      else
        env = ENV['RAILS_ENV'] || RAILS_ENV
        #load manually key since we have subdomains
        # if request.url.to_s.include?('www.')
        #           GMAPS_API_KEY = "ABQIAAAAuhwT7uBsmRtiCbPsilW88BSxsGsNsGaGFua-aUakP3VKKmziVxQj7zvABvmGYoBzb3RxcDPu94lEVg"
        #         elsif request.subdomains.first.to_s.eql?('de')
        #           GMAPS_API_KEY = "ABQIAAAAuhwT7uBsmRtiCbPsilW88BR46FPUkB9-w9KRp9IxPnme1fEpjxSmPbrTE6jSjtfu0PSbhohiqR9YuQ"
        #         elsif request.subdomains.first.to_s.eql?('en')
        #           GMAPS_API_KEY = "ABQIAAAAuhwT7uBsmRtiCbPsilW88BQeiR_yjAgcy3oysuNqEOJBZwhEARTFeQZPi4edN9q3yGeYyw2m6vKn2Q"
        #         else
        #           GMAPS_API_KEY = "ABQIAAAAuhwT7uBsmRtiCbPsilW88BSxsGsNsGaGFua-aUakP3VKKmziVxQj7zvABvmGYoBzb3RxcDPu94lEVg"
        #         end
        GMAPS_API_KEY = YAML.load_file(RAILS_ROOT + '/config/gmaps_api_key.yml')[env]
      end
      
      def self.get(options = {})
        if options.has_key?(:key)
          options[:key]
        elsif GMAPS_API_KEY.is_a?(Hash)
          #For this environment, multiple hosts are possible.
          #:host must have been passed as option
          if options.has_key?(:host)
            GMAPS_API_KEY[options[:host]]
          else
            raise AmbiguousGMapsAPIKeyException.new(GMAPS_API_KEY.keys.join(","))
          end
        else
          #Only one possible key: take it and ignore the :host option if it is there
          GMAPS_API_KEY
        end
      end
    end
  end
end
