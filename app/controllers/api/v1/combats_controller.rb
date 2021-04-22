# frozen_string_literal: true

module Api
  module V1
    class CombatsController < ApplicationController
      include(CombatHelper)
      def index
        @combats = Combat.all
        json_response(@combats, 200)
      end

      def create
        return render_error('unavailable', 403) if creation_errors?

        @combat = Combat.create!(params_create)
        combat_simulator(@combat)
        json_response(@combat, 201)
      end

      private

      def params_create
        params.permit(:attacker_id, :opponent_id)
      end

      def creation_errors?
        atk = params_create.fetch(:attacker_id)
        opp = params_create.fetch(:opponent_id)
        Pokemon.find([atk, opp]) # raising error
        true if Pokemon.where(id: [atk, opp], available: true).count != 2
      end
    end
  end
end
