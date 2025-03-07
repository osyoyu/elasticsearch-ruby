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
        # Retrieves configuration information for data frame analytics jobs.
        #
        # @option arguments [String] :id The ID of the data frame analytics to fetch
        # @option arguments [Boolean] :allow_no_match Whether to ignore if a wildcard expression matches no data frame analytics. (This includes `_all` string or when no data frame analytics have been specified)
        # @option arguments [Integer] :from skips a number of analytics
        # @option arguments [Integer] :size specifies a max number of analytics to get
        # @option arguments [Boolean] :exclude_generated Omits fields that are illegal to set on data frame analytics PUT
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/get-dfanalytics.html
        #
        def get_data_frame_analytics(arguments = {})
          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          _id = arguments.delete(:id)

          method = Elasticsearch::API::HTTP_GET
          path   = if _id
                     "_ml/data_frame/analytics/#{Utils.__listify(_id)}"
                   else
                     "_ml/data_frame/analytics"
                   end
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
