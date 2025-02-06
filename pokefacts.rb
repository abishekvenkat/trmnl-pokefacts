module Plugins
    class Pokefacts < Base
      BASE_URL = 'https://pokefacts.vercel.app/api'.freeze
  
      def locals
        { fact: fetch_fact }
      end
  
      private
  
      def fetch_fact
        @fact ||= begin
          response = HTTParty.get(BASE_URL)
          if response.success?
            JSON.parse(response.body)['fact']
          else
            "Failed to fetch Pokémon fact. Please try again later."
          end
        rescue => e
          "Error: #{e.message}"
        end
      end
    end
  end