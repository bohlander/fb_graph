module FbGraph
  class Query < Node
    attr_accessor :access_token, :query

    def initialize(query, access_token = nil)
      @endpoint = File.join(ROOT_URL, "fql")
      @query = query
      @access_token = access_token
    end

    def fetch(access_token = nil)
      handle_response do
        http_client.get @endpoint, build_params(access_token)
      end
    end

    private

    def build_params(access_token)
      super(
        :q => self.query,
        :access_token => access_token || self.access_token
      )
    end

  end
end
