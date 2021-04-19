# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it 'should validate presence of attributes' do
    should validate_presence_of(:name)
    should validate_presence_of(:p_type)
    should validate_presence_of(:hp)
    should validate_presence_of(:moves)
    should validate_presence_of(:available)
  end
end
