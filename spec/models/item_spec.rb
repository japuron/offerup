require "rails_helper"

RSpec.describe Item, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:comment) }

    it { should belong_to(:category) }

    it { should belong_to(:seller) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
