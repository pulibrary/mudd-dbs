require 'rails_helper'

RSpec.describe Honorary, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :lname }
    it { is_expected.to respond_to :fname }
    it { is_expected.to respond_to :year }
    it { is_expected.to respond_to :death }
    it { is_expected.to respond_to :degree }
    it { is_expected.to respond_to :file }
  end

  describe "search" do
    let(:described_class1) { described_class.create(lname: "Smith", fname: "Sally", year: 1928, degree: "No", file: "No", death: "1988")}
    let(:described_class2) { described_class.create(lname: "Smith", fname: "Joe", year: 1944, degree: "No", file: "No", death:"1999")}
    let(:described_class3) { described_class.create(lname: "Doe", fname: "Jane", year: 1977, degree: "No", file: "No", death: "n.a.")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for last name" do
      expect(described_class.search({"lname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for first name" do
      expect(described_class.search({"fname" => "SALLY"})).to contain_exactly(described_class1)
    end

    it "returns items for year" do
      expect(described_class.search({"year" => "77"})).to contain_exactly(described_class3)
    end

    it "returns items for degree" do
      expect(described_class.search({"degree" => "yes"})).to be_empty
    end

    it "returns items for file" do
      expect(described_class.search({"file" => "no"})).to contain_exactly(described_class1, described_class2, described_class3)
    end

    it "returns items for death" do
      expect(described_class.search({"death" => "1988"})).to contain_exactly(described_class1)
    end

    it "returns items for file and lname" do
      expect(described_class.search({"file" => "no", "lname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for fname and lname" do
      expect(described_class.search({"fname" => "SALLY", "lname" => "smith"})).to contain_exactly(described_class1)
    end
  end
end
