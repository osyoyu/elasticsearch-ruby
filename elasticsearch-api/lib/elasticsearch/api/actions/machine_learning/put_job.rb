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
        # Instantiates an anomaly detection job.
        #
        # @option arguments [String] :job_id The ID of the job to create
        # @option arguments [Boolean] :ignore_unavailable Ignore unavailable indexes (default: false). Only set if datafeed_config is provided.
        # @option arguments [Boolean] :allow_no_indices Ignore if the source indices expressions resolves to no concrete indices (default: true). Only set if datafeed_config is provided.
        # @option arguments [Boolean] :ignore_throttled Ignore indices that are marked as throttled (default: true). Only set if datafeed_config is provided.
        # @option arguments [String] :expand_wildcards Whether source index expressions should get expanded to open or closed indices (default: open). Only set if datafeed_config is provided. (options: open, closed, hidden, none, all)
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The job (*Required*)
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-job.html
        #
        def put_job(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          arguments = arguments.clone

          _job_id = arguments.delete(:job_id)

          method = Elasticsearch::API::HTTP_PUT
          path   = "_ml/anomaly_detectors/#{Utils.__listify(_job_id)}"
          params = Utils.process_params(arguments)

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
