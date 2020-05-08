require 'rails_helper'

RSpec.describe Memorabilium, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :box }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :category }
    it { is_expected.to respond_to :classyear }
    it { is_expected.to respond_to :reunion }
    it { is_expected.to respond_to :provenance }
  end

  describe "search" do
    let(:described_class1) { described_class.create(box: "1", description: "CooL", category: "clothing", classyear: 1928, reunion: "Yes", provenance: "No")}
    let(:described_class2) { described_class.create(box: "16", description: "CooL", category: "print", classyear: 1944, reunion: "Yes", provenance: "No")}
    let(:described_class3) { described_class.create(box: "26", description: "Doe", category: "paper", classyear: 1977, reunion: "No", provenance: "No")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for box" do
      expect(described_class.search({"box" => "1"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for description" do
      expect(described_class.search({"description" => "cool"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for category" do
      expect(described_class.search({"category" => "clothing"})).to contain_exactly(described_class1)
    end

    it "returns items for reunion" do
      expect(described_class.search({"reunion" => "no"})).to contain_exactly(described_class3)
    end

    it "returns items for classyear" do
      expect(described_class.search({"classyear" => "77"})).to contain_exactly(described_class3)
    end

    it "returns items for provenance" do
      expect(described_class.search({"provenance" => "no"})).to contain_exactly(described_class1, described_class2, described_class3)
    end

    it "returns items for provenance and description" do
      expect(described_class.search({"provenance" => "no", "description" => "coo"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for category and description" do
      expect(described_class.search({"category" => "clothing", "description" => "ool"})).to contain_exactly(described_class1)
    end
  end
end
