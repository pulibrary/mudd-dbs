require 'rails_helper'

RSpec.describe Alumn, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :box }
    it { is_expected.to respond_to :lname }
    it { is_expected.to respond_to :fname }
    it { is_expected.to respond_to :year }
    it { is_expected.to respond_to :graduate }
    it { is_expected.to respond_to :photos }
    it { is_expected.to respond_to :oversize }
    it { is_expected.to respond_to :photos }
  end

  describe "search" do
    let(:described_class1) { described_class.create(box: "1", lname: "Smith", fname: "Sally", year: 1928, graduate: "Yes", oversize: "No", photos: "No")}
    let(:described_class2) { described_class.create(box: "16", lname: "Smith", fname: "Joe", year: 1944, graduate: "Yes", oversize: "No", photos: "No")}
    let(:described_class3) { described_class.create(box: "26", lname: "Doe", fname: "Jane", year: 1977, graduate: "No", oversize: "No", photos: "No")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for box" do
      expect(described_class.search({"box" => "1"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for last name" do
      expect(described_class.search({"lname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for first name" do
      expect(described_class.search({"fname" => "SALLY"})).to contain_exactly(described_class1)
    end

    it "returns items for graduate" do
      expect(described_class.search({"graduate" => "no"})).to contain_exactly(described_class3)
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

    it "returns items for photos and lname" do
      expect(described_class.search({"photos" => "no", "lname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for fname and lname" do
      expect(described_class.search({"fname" => "SALLY", "lname" => "smith"})).to contain_exactly(described_class1)
    end
  end
end
