require 'rails_helper'

RSpec.describe LeadsController, type: :controller do
  let(:app) { described_class }
  let(:leads_json) { file_fixture('leads.json').read }

  context 'with correct data' do
    let(:resp) do
      post :create, body: leads_json, format: :json
    end

    it 'has 200 status' do
      expect(resp.status).to eq(200)
    end
  end
end
