# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CombatHelper do
  describe 'simulates a combat' do
    let(:combat) { create(:combat) }
    before { combat_simulator(combat) }
    it 'ends by K.O' do
      expect(Combat.first.winner_id).to be_nonzero
    end
  end
end
