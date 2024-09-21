require "singleton"

module Wineskills
  class Rpc
    include Singleton
    attr_accessor :client

    private

    def initialize
      @client =
        ::Gruf::Client.new(
          service: ::WineskillsRpc::Wines,
          options: {
            hostname: ENV.fetch("GRPC_SERVICES_URL"),
          },
        )
    end
  end
end
