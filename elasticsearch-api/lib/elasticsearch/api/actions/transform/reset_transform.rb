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
        # Resets an existing transform.
        #
        # @option arguments [String] :transform_id The id of the transform to reset
        # @option arguments [Boolean] :force When `true`, the transform is reset regardless of its current state. The default value is `false`, meaning that the transform must be `stopped` before it can be reset.
        # @option arguments [Time] :timeout Controls the time to wait for the transform to reset
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/reset-transform.html
        #
        def reset_transform(arguments = {})
          raise ArgumentError, "Required argument 'transform_id' missing" unless arguments[:transform_id]

          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          _transform_id = arguments.delete(:transform_id)

          method = Elasticsearch::API::HTTP_POST
          path   = "_transform/#{Utils.__listify(_transform_id)}/_reset"
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
