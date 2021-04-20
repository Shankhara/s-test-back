# frozen_string_literal: true

module Api
  module V1
    class CombatsController < ApplicationController
      def index
        @combats = Combat.all
        json_response(@combats, 200)
      end

      def create
        @combat = Combat.create!(params_create)
        json_response(@combat, 200)
      end

      private

      def params_create
        params.permit(:attacker_id, :opponent_id)
      end
    end
  end
end
