# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elasticsearch
  module API
    module DanglingIndices
      module Actions
        # Deletes the specified dangling index
        #
        # @option arguments [String] :index_uuid The UUID of the dangling index
        # @option arguments [Boolean] :accept_data_loss Must be set to true in order to delete the dangling index
        # @option arguments [Time] :timeout Explicit operation timeout
        # @option arguments [Time] :master_timeout Specify timeout for connection to master
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-gateway-dangling-indices.html
        #
        def delete_dangling_index(arguments = {})
          raise ArgumentError, "Required argument 'index_uuid' missing" unless arguments[:index_uuid]

          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          _index_uuid = arguments.delete(:index_uuid)

          method = Elasticsearch::API::HTTP_DELETE
          path   = "_dangling/#{Utils.__listify(_index_uuid)}"
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
