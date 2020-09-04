# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module scryfall
  #
  # Cards
  #
  class Cards

    #
    # Creates and initializes a new instance of the Cards class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [ScryfallClient] reference to the ScryfallClient
    attr_reader :client

    #
    # @param q [String]
    # @param unique [UniqueStrategy] Possible values include: 'cards', 'art',
    # 'prints'
    # @param order [SortOrder] Possible values include: 'name', 'set', 'released',
    # 'rarity', 'color', 'usd', 'tix', 'eur', 'cmc', 'power', 'toughness',
    # 'edhrec', 'artist'
    # @param dir [SortDirection] Possible values include: 'auto', 'asc', 'desc'
    # @param include_extras [Boolean]
    # @param page [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [CardList] operation results.
    #
    def search(q, unique:nil, order:nil, dir:nil, include_extras:nil, page:nil, custom_headers:nil)
      response = search_async(q, unique:unique, order:order, dir:dir, include_extras:include_extras, page:page, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param q [String]
    # @param unique [UniqueStrategy] Possible values include: 'cards', 'art',
    # 'prints'
    # @param order [SortOrder] Possible values include: 'name', 'set', 'released',
    # 'rarity', 'color', 'usd', 'tix', 'eur', 'cmc', 'power', 'toughness',
    # 'edhrec', 'artist'
    # @param dir [SortDirection] Possible values include: 'auto', 'asc', 'desc'
    # @param include_extras [Boolean]
    # @param page [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def search_with_http_info(q, unique:nil, order:nil, dir:nil, include_extras:nil, page:nil, custom_headers:nil)
      search_async(q, unique:unique, order:order, dir:dir, include_extras:include_extras, page:page, custom_headers:custom_headers).value!
    end

    #
    # @param q [String]
    # @param unique [UniqueStrategy] Possible values include: 'cards', 'art',
    # 'prints'
    # @param order [SortOrder] Possible values include: 'name', 'set', 'released',
    # 'rarity', 'color', 'usd', 'tix', 'eur', 'cmc', 'power', 'toughness',
    # 'edhrec', 'artist'
    # @param dir [SortDirection] Possible values include: 'auto', 'asc', 'desc'
    # @param include_extras [Boolean]
    # @param page [Integer]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def search_async(q, unique:nil, order:nil, dir:nil, include_extras:nil, page:nil, custom_headers:nil)
      fail ArgumentError, 'q is nil' if q.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/search'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          query_params: {'q' => q,'unique' => unique,'order' => order,'dir' => dir,'include_extras' => include_extras,'page' => page},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::CardList.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param exact [String]
    # @param fuzzy [String]
    # @param set [String]
    # @param format [String]
    # @param face [String]
    # @param version [String]
    # @param pretty [Boolean]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Card] operation results.
    #
    def get_named(exact:nil, fuzzy:nil, set:nil, format:nil, face:nil, version:nil, pretty:nil, custom_headers:nil)
      response = get_named_async(exact:exact, fuzzy:fuzzy, set:set, format:format, face:face, version:version, pretty:pretty, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param exact [String]
    # @param fuzzy [String]
    # @param set [String]
    # @param format [String]
    # @param face [String]
    # @param version [String]
    # @param pretty [Boolean]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_named_with_http_info(exact:nil, fuzzy:nil, set:nil, format:nil, face:nil, version:nil, pretty:nil, custom_headers:nil)
      get_named_async(exact:exact, fuzzy:fuzzy, set:set, format:format, face:face, version:version, pretty:pretty, custom_headers:custom_headers).value!
    end

    #
    # @param exact [String]
    # @param fuzzy [String]
    # @param set [String]
    # @param format [String]
    # @param face [String]
    # @param version [String]
    # @param pretty [Boolean]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_named_async(exact:nil, fuzzy:nil, set:nil, format:nil, face:nil, version:nil, pretty:nil, custom_headers:nil)


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/named'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          query_params: {'exact' => exact,'fuzzy' => fuzzy,'set' => set,'format' => format,'face' => face,'version' => version,'pretty' => pretty},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Card.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param q [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Catalog] operation results.
    #
    def autocomplete(q, custom_headers:nil)
      response = autocomplete_async(q, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param q [String]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def autocomplete_with_http_info(q, custom_headers:nil)
      autocomplete_async(q, custom_headers:custom_headers).value!
    end

    #
    # @param q [String]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def autocomplete_async(q, custom_headers:nil)
      fail ArgumentError, 'q is nil' if q.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/autocomplete'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          query_params: {'q' => q},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Catalog.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Card] operation results.
    #
    def get_random(custom_headers:nil)
      response = get_random_async(custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_random_with_http_info(custom_headers:nil)
      get_random_async(custom_headers:custom_headers).value!
    end

    #
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_random_async(custom_headers:nil)


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/random'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Card.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param id [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Card] operation results.
    #
    def get_by_multiverse_id(id, custom_headers:nil)
      response = get_by_multiverse_id_async(id, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param id [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_by_multiverse_id_with_http_info(id, custom_headers:nil)
      get_by_multiverse_id_async(id, custom_headers:custom_headers).value!
    end

    #
    # @param id [Integer]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_by_multiverse_id_async(id, custom_headers:nil)
      fail ArgumentError, 'id is nil' if id.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/multiverse/{id}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'id' => id},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Card.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param id [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Card] operation results.
    #
    def get_by_mtgo_id(id, custom_headers:nil)
      response = get_by_mtgo_id_async(id, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param id [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_by_mtgo_id_with_http_info(id, custom_headers:nil)
      get_by_mtgo_id_async(id, custom_headers:custom_headers).value!
    end

    #
    # @param id [Integer]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_by_mtgo_id_async(id, custom_headers:nil)
      fail ArgumentError, 'id is nil' if id.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/mtgo/{id}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'id' => id},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Card.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param id [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Card] operation results.
    #
    def get_by_arena_id(id, custom_headers:nil)
      response = get_by_arena_id_async(id, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param id [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_by_arena_id_with_http_info(id, custom_headers:nil)
      get_by_arena_id_async(id, custom_headers:custom_headers).value!
    end

    #
    # @param id [Integer]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_by_arena_id_async(id, custom_headers:nil)
      fail ArgumentError, 'id is nil' if id.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/arena/{id}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'id' => id},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Card.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param code [String]
    # @param number [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Card] operation results.
    #
    def get_by_code_by_number(code, number, custom_headers:nil)
      response = get_by_code_by_number_async(code, number, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param code [String]
    # @param number [Integer]
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_by_code_by_number_with_http_info(code, number, custom_headers:nil)
      get_by_code_by_number_async(code, number, custom_headers:custom_headers).value!
    end

    #
    # @param code [String]
    # @param number [Integer]
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_by_code_by_number_async(code, number, custom_headers:nil)
      fail ArgumentError, 'code is nil' if code.nil?
      fail ArgumentError, 'number is nil' if number.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/{code}/{number}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'code' => code,'number' => number},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Card.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # @param id
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Card] operation results.
    #
    def get_by_id(id, custom_headers:nil)
      response = get_by_id_async(id, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # @param id
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_by_id_with_http_info(id, custom_headers:nil)
      get_by_id_async(id, custom_headers:custom_headers).value!
    end

    #
    # @param id
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_by_id_async(id, custom_headers:nil)
      fail ArgumentError, 'id is nil' if id.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      path_template = 'cards/{id}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'id' => id},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = scryfall::Models::Card.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end
