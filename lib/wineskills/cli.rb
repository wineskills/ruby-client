require "thor"

module Wineskills
  class CLI < Thor
    desc "wines", "Prints all wines"
    def wines
      client = ::Gruf::Client.new(service: ::WineskillsRpc::Wines, options: { hostname: ENV.fetch("GRPC_SERVICES_URL") } )
      puts client.call(:GetWines).message.wines
    end
  end
end
