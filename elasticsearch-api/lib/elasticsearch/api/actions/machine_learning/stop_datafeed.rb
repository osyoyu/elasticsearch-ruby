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
        # Stops one or more datafeeds.
        #
        # @option arguments [String] :datafeed_id The ID of the datafeed to stop
        # @option arguments [Boolean] :allow_no_match Whether to ignore if a wildcard expression matches no datafeeds. (This includes `_all` string or when no datafeeds have been specified)
        # @option arguments [Boolean] :allow_no_datafeeds Whether to ignore if a wildcard expression matches no datafeeds. (This includes `_all` string or when no datafeeds have been specified) *Deprecated*
        # @option arguments [Boolean] :force True if the datafeed should be forcefully stopped.
        # @option arguments [Time] :timeout Controls the time to wait until a datafeed has stopped. Default to 20 seconds
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The URL params optionally sent in the body
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-stop-datafeed.html
        #
        def stop_datafeed(arguments = {})
          raise ArgumentError, "Required argument 'datafeed_id' missing" unless arguments[:datafeed_id]

          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          arguments = arguments.clone

          _datafeed_id = arguments.delete(:datafeed_id)

          method = Elasticsearch::API::HTTP_POST
          path   = "_ml/datafeeds/#{Utils.__listify(_datafeed_id)}/_stop"
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
