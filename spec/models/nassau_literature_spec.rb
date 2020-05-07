require 'rails_helper'

RSpec.describe NassauLiterature, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :lname }
    it { is_expected.to respond_to :fname }
    it { is_expected.to respond_to :classyear }
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :date }
    it { is_expected.to respond_to :issue_no }
    it { is_expected.to respond_to :pages }
  end

  describe "search" do
    let(:described_class1) { described_class.create(lname: "Smith", fname: "Sally", classyear: 1928, title: "Yes for me")}
    let(:described_class2) { described_class.create(lname: "Smith", fname: "Joe", classyear: 1944, title: "Yes and you?")}
    let(:described_class3) { described_class.create(lname: "Doe", fname: "Jane", classyear: 1977, title: "No thank you!")}
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

    it "returns items for title" do
      expect(described_class.search({"title" => "no"})).to contain_exactly(described_class3)
    end

    it "returns items for classyear" do
      expect(described_class.search({"classyear" => "77"})).to contain_exactly(described_class3)
    end

    it "returns items for title and lname" do
      expect(described_class.search({"title" => "yes", "lname" => "smith"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for fname and lname" do
      expect(described_class.search({"fname" => "SALLY", "lname" => "smith"})).to contain_exactly(described_class1)
    end
  end
end
