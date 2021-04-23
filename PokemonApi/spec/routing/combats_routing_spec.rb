# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CombatsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/v1/combats').to route_to('api/v1/combats#index')
    end

    it 'routes to #create' do
      expect(post: 'api/v1/combats').to route_to('api/v1/combats#create')
    end
  end
end
