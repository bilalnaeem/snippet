require 'rails_helper'

RSpec.describe Code, type: :model do
  let(:model) { described_class }

  describe "CRUD operations" do
    subject(:item) { create model }

    it "is created" do
      expect { create(model) }.to change(model, :count).by(1)
    end

  end

  describe "Validation" do
    let(:new_item) { model.new }
    let(:item) { create model }

    specify "default is not private" do
      expect(item.is_private).to eq false
    end

    it "is not created if it is not valid" do
      expect(new_item).to_not be_valid
    end

  end

end

