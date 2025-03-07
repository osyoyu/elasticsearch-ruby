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
    module CrossClusterReplication
      module Actions
        # Pauses a follower index. The follower index will not fetch any additional operations from the leader index.
        #
        # @option arguments [String] :index The name of the follower index that should pause following its leader index.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ccr-post-pause-follow.html
        #
        def pause_follow(arguments = {})
          raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = Elasticsearch::API::HTTP_POST
          path   = "#{Utils.__listify(_index)}/_ccr/pause_follow"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
