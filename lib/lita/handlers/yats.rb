require 'httparty'
require 'nokogiri'

module Lita
  module Handlers
    class Yats < Handler
      URL = "http://www.yatscajuncreole.com/menu/#5"

      route(/^yats/i, :menu, command: true, help: {
        "yats" => "display menu for Yats in Carmel, IN"
      })

      def menu(response)
        http_response = HTTParty.get URL
        doc = Nokogiri::HTML(http_response.body)
        nodes = doc.xpath('//div[@id="5"]/ul/li')
        list = nodes.collect {|node| node.text.strip}
        response.reply list.join("\n")
      end
    end

    Lita.register_handler(Yats)
  end
end
