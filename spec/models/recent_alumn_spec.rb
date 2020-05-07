require 'rails_helper'

RSpec.describe RecentAlumn, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :lname }
    it { is_expected.to respond_to :fname }
    it { is_expected.to respond_to :year }
    it { is_expected.to respond_to :pubfile }
    it { is_expected.to respond_to :academicfile }
  end
  
  describe "search" do
    let(:described_class1) { described_class.create(lname: "Smith", fname: "Sally", year: 1928, pubfile: "Yes", academicfile: "No")}
    let(:described_class2) { described_class.create(lname: "Smith", fname: "Joe", year: 1944, pubfile: "Yes", academicfile: "No")}
    let(:described_class3) { described_class.create(lname: "Doe", fname: "Jane", year: 1977, pubfile: "No", academicfile: "No")}
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

    it "returns items for pubfile" do
      expect(described_class.search({"pubfile" => "yes"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for academicfile" do
      expect(described_class.search({"academicfile" => "no"})).to contain_exactly(described_class1, described_class2, described_class3)
    end

    it "returns items for academicfile and lname" do
      expect(described_class.search({"academicfile" => "no", "lname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for fname and lname" do
      expect(described_class.search({"fname" => "SALLY", "lname" => "smith"})).to contain_exactly(described_class1)
    end
  end
end
