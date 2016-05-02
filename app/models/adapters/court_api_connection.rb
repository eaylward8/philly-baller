module Adapters
  class CourtApiConnection
    include HTTParty
    attr_reader :connection
    base_uri 'https://www.opendataphilly.org/api/action/datastore_search'

    def initialize
      @connection = self.class
    end
  end
end