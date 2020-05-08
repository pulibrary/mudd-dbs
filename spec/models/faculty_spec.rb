require 'rails_helper'

RSpec.describe Faculty, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :access_id }
    it { is_expected.to respond_to :box }
    it { is_expected.to respond_to :lname }
    it { is_expected.to respond_to :fname }
    it { is_expected.to respond_to :birth }
    it { is_expected.to respond_to :birth_year }
    it { is_expected.to respond_to :death }
    it { is_expected.to respond_to :leave }
    it { is_expected.to respond_to :dept }
    it { is_expected.to respond_to :series }
  end

  describe "search" do
    let(:described_class1) { described_class.create(box: "1", lname: "Smith", fname: "Sally", birth_year: 1928, death: "2020", birth: "Januray 1, 1928", leave: "1988", dept: "CLA", series: 'a')}
    let(:described_class2) { described_class.create(box: "16", lname: "Smith", fname: "Joe", birth_year: 1944, death: "n.a.", birth: "Januray 1, 1944", leave: "1999", dept: "OTR", series: 'b')}
    let(:described_class3) { described_class.create(box: "26", lname: "Doe", fname: "Jane", birth_year: 1977, death: "n.a.", birth: "Januray 1, 1977", leave: "n.a.", dept: "CLA", series: 'c')}
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

    it "returns items for birth_year" do
      expect(described_class.search({"birth_year" => "1977"})).to contain_exactly(described_class3)
    end

    it "returns items for birth" do
      expect(described_class.search({"birth" => "77"})).to contain_exactly(described_class3)
    end

    it "returns items for death" do
      expect(described_class.search({"death" => "20"})).to contain_exactly(described_class1)
    end

    it "returns items for leave" do
      expect(described_class.search({"leave" => "88"})).to contain_exactly(described_class1)
    end

    it "returns items for dept" do
      expect(described_class.search({"dept" => "cla"})).to contain_exactly(described_class1, described_class3)
    end

    it "returns items for series" do
      expect(described_class.search({"series" => "A"})).to contain_exactly(described_class1)
    end

    it "returns items for dept and lname" do
      expect(described_class.search({"dept" => "cla", "lname" => "smith"})).to contain_exactly(described_class1)
    end

    it "returns items for fname and lname" do
      expect(described_class.search({"fname" => "SALLY", "lname" => "smith"})).to contain_exactly(described_class1)
    end
  end
end
