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
    module Transform
      module Actions
        # Instantiates a transform.
        #
        # @option arguments [String] :transform_id The id of the new transform.
        # @option arguments [Boolean] :defer_validation If validations should be deferred until transform starts, defaults to false.
        # @option arguments [Time] :timeout Controls the time to wait for the transform to start
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The transform definition (*Required*)
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/put-transform.html
        #
        def put_transform(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'transform_id' missing" unless arguments[:transform_id]

          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          arguments = arguments.clone

          _transform_id = arguments.delete(:transform_id)

          method = Elasticsearch::API::HTTP_PUT
          path   = "_transform/#{Utils.__listify(_transform_id)}"
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
