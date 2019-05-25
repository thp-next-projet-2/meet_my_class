# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisitorsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with(200) }
  end
end
