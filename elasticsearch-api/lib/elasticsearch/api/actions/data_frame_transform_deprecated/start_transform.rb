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
    module DataFrameTransformDeprecated
      module Actions
        # Starts one or more transforms.
        # This functionality is in Beta and is subject to change. The design and
        # code is less mature than official GA features and is being provided
        # as-is with no warranties. Beta features are not subject to the support
        # SLA of official GA features.
        #
        # @option arguments [String] :transform_id The id of the transform to start
        # @option arguments [Time] :timeout Controls the time to wait for the transform to start
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # *Deprecation notice*:
        # [_data_frame/transforms/] is deprecated, use [_transform/] in the future.
        # Deprecated since version 7.5.0
        #
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/start-transform.html
        #
        def start_transform(arguments = {})
          raise ArgumentError, "Required argument 'transform_id' missing" unless arguments[:transform_id]

          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          _transform_id = arguments.delete(:transform_id)

          method = Elasticsearch::API::HTTP_POST
          path   = "_data_frame/transforms/#{Utils.__listify(_transform_id)}/_start"
          params = Utils.process_params(arguments)

          perform_request(method, path, params, body, headers).body
        end
      end
    end
  end
end
