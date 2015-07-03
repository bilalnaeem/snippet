require 'rails_helper'

RSpec.describe Api::V1::CodesController, type: :controller do
  let(:model) { Code }
  describe "GET #index" do
    let!(:items) { 13.times.map { |n| Timecop.freeze(Time.current - n.hour) {create model } } }

    # Examples
    context "when success" do
      it "returns all public codes" do
        get :index, format: "json"
        expect(response).to be_success
        expect(items).to eq assigns(:codes)
      end
    end
  end

  describe "GET #show" do
    subject(:public_code) { create :code, is_private: false, token: nil }

    # Examples
    context "when success" do
      it "returns public code" do
        get :show, id: public_code.id, format: "json"
        expect(response).to be_success
        expect(public_code).to eq assigns(:code)
      end
    end
  end

  describe "GET #secret_show" do
    subject(:secret_code) { create :code, is_private: true, token: SecureRandom.hex(32) }

    # Examples
    context "when success" do
      it "returns private code" do
        get :secret_show, id: secret_code.id, token: secret_code.token, format: "json"
        expect(response).to be_success
        expect(secret_code).to eq assigns(:code)
      end
    end
  end
end
