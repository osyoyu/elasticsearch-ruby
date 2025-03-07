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
    module MachineLearning
      module Actions
        # Deletes an existing datafeed.
        #
        # @option arguments [String] :datafeed_id The ID of the datafeed to delete
        # @option arguments [Boolean] :force True if the datafeed should be forcefully deleted
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-delete-datafeed.html
        #
        def delete_datafeed(arguments = {})
          raise ArgumentError, "Required argument 'datafeed_id' missing" unless arguments[:datafeed_id]

          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          _datafeed_id = arguments.delete(:datafeed_id)

          method = Elasticsearch::API::HTTP_DELETE
          path   = "_ml/datafeeds/#{Utils.__listify(_datafeed_id)}"
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
