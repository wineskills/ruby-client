require "thor"

module Wineskills
  class CLI < Thor
    desc "wines", "Prints all wines"
    def wines
      puts Rpc.instance.client.call(:GetWines).message.wines
    end

    desc "search QUERY", "Search wines with QUERY"
    def search(query)
      puts Rpc.instance.client.call(:SearchWines, query: query).message.wines
    end
  end
end
