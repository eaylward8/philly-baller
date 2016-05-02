module Adapters
  class CourtClient

    def self.connection
      @connection ||= CourtApiConnection.new
    end

    def self.get_data(resource_id, result_limit, query)
      response = connection.class.get("?resource_id=#{resource_id}&limit=#{result_limit}&q=#{query}")
      records = response["result"]["records"]
      records.each do |record|
        name = record["ASSET_NAME"]
        # skip the one record that is not a basketball court
        next if name.split(" ").include?("Handball")
        address = record["ASSET_ADDR"]
        url = record["URL"]
        council_district = record["COUNCIL_DIST"]
        pcpc_district = record["PCPC_DIST"]
        create_court(name, address, url, council_district, pcpc_district)
      end
    end

    def self.create_court(name, address, url, council_district, pcpc_district)
      Court.create(name: name, address: address, url: url, council_district: council_district, pcpc_district: pcpc_district)
    end
  end
end

# adapter = Adapters::CourtClient.new
# adapter.get_data("aba9bbe0-9e46-44fc-aff8-f9a925f5256e", 1000, "basketball")

# resource_id=aba9bbe0-9e46-44fc-aff8-f9a925f5256e&limit=1000&q=basketball