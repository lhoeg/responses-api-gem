# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require_relative 'form_request'
require 'open-uri'
require 'hashie'
Hash.send :include, Hashie::Extensions

module ResponsesApi
  class RetrieveResponsesRequest < FormRequest
    ISO_8601_FORMAT = '%Y-%m-%dT%H:%M:%S'.freeze

    def initialize(form_id, token: APIConfig.token, page_size: 25, page: nil, ts_since: nil, ts_until: nil, after: nil, before: nil, completed: true,
      sort: nil, query: nil, fields: nil)
      url = "#{APIConfig.api_request_url}/forms/#{form_id}/responses?"
      url << "page_size=#{page_size}&" unless page_size.nil?
      url << "page=#{page}&" unless page.nil?
      url << "since=#{ts_since.utc.strftime(ISO_8601_FORMAT)}&" unless ts_since.nil?
      url << "until=#{ts_until.utc.strftime(ISO_8601_FORMAT)}&" unless ts_until.nil?
      url << "after=#{after}&" unless after.nil?
      url << "before=#{before}&" unless before.nil?
      url << "completed=#{completed}&" unless completed.nil?
      url << "sort=#{sort}&" unless sort.nil?
      url << "query=#{query}&" unless query.nil?
      url << "fields=#{fields}&" unless fields.nil?
      r = {
        method: :get,
        url: url
      }
      r[:headers] = { 'Authorization' => "Bearer #{token}" } unless token.nil?

      request(r)
    end

    def success?
      @response.code == 200 && json?
    end

    def responses(hashie: true)
      if hashie
        Hashie::Mash.new(json).items
      else
        json.fetch(:items)
      end
    end

    def page_count
      json.fetch(:page_count)
    end

    def total_items
      json.fetch(:total_items)
    end
  end
end
