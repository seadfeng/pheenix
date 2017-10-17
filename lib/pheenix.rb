require "pheenix/version"
require "curb" 
require "json" 
class Pheenix
	attr_accessor :login, :pheenix_host, :curl_cookie, :curl_verbose

    def initialize(login = {}) 
      @login = login
      @pheenix_host = "https://api.pheenix.com/"
      @curl_cookie = "/tmp/px_cookie" 
      @curl_verbose = false
      pheenix_login
      self
    end

    def pheenix_login
    	curl("#{pheenix_host}login/login=#{login[:username]}&api_key=#{login[:api_key]}")
    end

	# Return: array
	# 
	# Arguments:
	# 
	# string - url
    def curl(url)
      curl = Curl::Easy.new(url)
	  curl.follow_location = true
	  curl.enable_cookies = true
	  curl.verbose = curl_verbose
	  curl.cookiefile = curl_cookie
	  curl.cookiejar = curl_cookie
      #curl.perform 
      curl.http_get
      JSON.parse(curl.body_str)
    end 

 	# Return: string
	#   
    def args(name, args ) 
    	if args.class == Array
		    args.each do |item|
		       	i = 0 
	   			if i == 0
	   					str = "#{name}[0]=#{item}"
	   				else
	   					str = "#{str}&#{name}[#{i}]=#{item}"
	   			end
	   			i = i + 1
	   		end  
	   	else
	   		str = "#{name}=#{args}"
	   	end
    end 

    def list_domains(config = {}) 
    	if !config[:all].nil? || config[:domains].nil?
    		curl("#{pheenix_host}list_domains")
    	else
    		str = args("domains",config[:domains])
    	end 
       	curl("#{pheenix_host}list_domains/#{str}")  
    end

    def reseller_check_domains_availability(config = {}) 
   	   str = args("domains",config[:domains])
       curl("#{pheenix_host}reseller_check_domains_availability/#{str}")  	
    end

    def reseller_register_domains(config = {}) 
   	   str = args("domains",config[:domains])
       curl("#{pheenix_host}reseller_register_domains/#{str}")  	
    end 
    
    def list_backorders
    	curl("#{pheenix_host}list_backorders") 
    end

    def list_won_marketplace
    	curl("#{pheenix_host}list_won_marketplace") 
    end

    def list_marketplace
    	curl("#{pheenix_host}list_marketplace") 
    end

    def list_lost_marketplace
    	curl("#{pheenix_host}list_lost_marketplace") 
    end

    def list_current_marketplace
    	curl("#{pheenix_host}list_current_marketplace") 
    end
    
end

