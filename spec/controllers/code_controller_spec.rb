require 'rails_helper'

RSpec.describe Api::V1::CodesController, type: :controller do
  let(:model) { Code }
  describe "GET #index" do
    let!(:items) { 13.times.map { |n| Timecop.freeze(Time.current - n.hour) {create model } } }

    # Examples
    context "when success" do
      it "returns all codes" do
        get :index, format: "json"
        expect(response).to be_success
        expect(items).to eq assigns(:codes)
      end
    end
  end

  describe "GET #show" do
    let!(:item) { create model }

    # Examples
    context "when success" do
      it "returns code" do
        get :show, id: item.id, format: "json"
        expect(response).to be_success
        expect(item).to eq assigns(:code)
      end
    end
  end
end
