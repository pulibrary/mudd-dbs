require 'rails_helper'

RSpec.describe WwiiMemorial, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :access_id }
    it { is_expected.to respond_to :last_name }
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :death_date }
    it { is_expected.to respond_to :death_year }
    it { is_expected.to respond_to :rank }
    it { is_expected.to respond_to :place }
    it { is_expected.to respond_to :year }
  end

  describe "search" do
    let(:described_class1) { described_class.create(place: "1", last_name: "Smith", name: "Sally", death_date: 1928, death_year: "1928", rank: "No", year: "1922")}
    let(:described_class2) { described_class.create(place: "16", last_name: "Smith", name: "Joe", death_date: 1944, death_year: "1944", rank: "No", year: "1922")}
    let(:described_class3) { described_class.create(place: "26", last_name: "Doe", name: "Jane", death_date: 1977, death_year: "1977", rank: "No", year: "1922")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for place" do
      expect(described_class.search({"place" => "1"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for first name" do
      expect(described_class.search({"name" => "SALLY"})).to contain_exactly(described_class1)
    end

    it "returns items for death_year" do
      expect(described_class.search({"death_year" => "77"})).to contain_exactly(described_class3)
    end

    it "returns items for rank" do
      expect(described_class.search({"rank" => "yes"})).to be_empty
    end

    it "returns items for year" do
      expect(described_class.search({"year" => "1922"})).to contain_exactly(described_class1, described_class2, described_class3)
      expect(described_class.search({"year" => "1920"})).to be_empty
    end

    it "returns items for name and place" do
      expect(described_class.search({"name" => "SALLY", "place" => "1"})).to contain_exactly(described_class1)
    end
  end
end
