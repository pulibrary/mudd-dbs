require 'rails_helper'

RSpec.describe Graduate, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :box }
    it { is_expected.to respond_to :lastname }
    it { is_expected.to respond_to :firstname }
    it { is_expected.to respond_to :year }
    it { is_expected.to respond_to :department }
    it { is_expected.to respond_to :deathdate }
    it { is_expected.to respond_to :oversize }
    it { is_expected.to respond_to :photos }
  end

  describe "search" do
    let(:described_class1) { described_class.create(box: "1", lastname: "Smith", firstname: "Sally", year: 1928, department: "A1", oversize: "No", photos: "No", deathdate: "1988")}
    let(:described_class2) { described_class.create(box: "16", lastname: "Smith", firstname: "Joe", year: 1944, department: "B2", oversize: "No", photos: "No", deathdate:"1999")}
    let(:described_class3) { described_class.create(box: "26", lastname: "Doe", firstname: "Jane", year: 1977, department: "ABC", oversize: "No", photos: "No", deathdate: "n.a.")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for box" do
      expect(described_class.search({"box" => "1"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for last name" do
      expect(described_class.search({"lastname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for first name" do
      expect(described_class.search({"firstname" => "SALLY"})).to contain_exactly(described_class1)
    end

    it "returns items for department" do
      expect(described_class.search({"department" => "abc"})).to contain_exactly(described_class3)
    end

    it "returns items for year" do
      expect(described_class.search({"year" => "77"})).to contain_exactly(described_class3)
    end

    it "returns items for oversize" do
      expect(described_class.search({"oversize" => "yes"})).to be_empty
    end

    it "returns items for photos" do
      expect(described_class.search({"photos" => "no"})).to contain_exactly(described_class1, described_class2, described_class3)
    end

    it "returns items for deathdate" do
      expect(described_class.search({"deathdate" => "1988"})).to contain_exactly(described_class1)
    end

    it "returns items for photos and lastname" do
      expect(described_class.search({"photos" => "no", "lastname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for firstname and lastname" do
      expect(described_class.search({"firstname" => "SALLY", "lastname" => "smith"})).to contain_exactly(described_class1)
    end
  end
end
