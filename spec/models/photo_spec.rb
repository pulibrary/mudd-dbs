require 'rails_helper'

RSpec.describe Photo, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :image_num }
    it { is_expected.to respond_to :box }
    it { is_expected.to respond_to :item_num }
    it { is_expected.to respond_to :accession_num }
    it { is_expected.to respond_to :e_num }
    it { is_expected.to respond_to :negative_num }
    it { is_expected.to respond_to :image_type }
    it { is_expected.to respond_to :photographer }
    it { is_expected.to respond_to :notes }
    it { is_expected.to respond_to :division }
    it { is_expected.to respond_to :date_taken }
    it { is_expected.to respond_to :subseries }
    it { is_expected.to respond_to :general_sub }
    it { is_expected.to respond_to :specific_sub }
    it { is_expected.to respond_to :publication }
    it { is_expected.to respond_to :online_image }
  end

  describe "search" do
    let(:described_class1) { described_class.create(notes: "zz", photographer: "building ff", date_taken: "fred", subseries: "Yes", general_sub: "Here", division: "good")}
    let(:described_class2) { described_class.create(notes: "ZZ", photographer: "building ff123", date_taken: "Jill", subseries: "Yes", general_sub: "There", division: "bad")}
    let(:described_class3) { described_class.create(notes: "CC", photographer: "Jane", date_taken: "Jane", subseries: "No", general_sub: "Every", division: "average")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for photographer" do
      expect(described_class.search({"subject1" => "FF"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for original_assigned" do
      expect(described_class.search({"subject1" => "zz"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for date_taken" do
      expect(described_class.search({"subject1" => "jill"})).to contain_exactly(described_class2)
    end

    it "returns items for subseries" do
      expect(described_class.search({"subject1" => "no"})).to contain_exactly(described_class3)
    end

    it "returns items for general_sub" do
      expect(described_class.search({"subject1" => "every"})).to contain_exactly(described_class3)
    end

    it "returns items for division" do
      expect(described_class.search({"subject1" => "bad"})).to contain_exactly(described_class2)
    end

    it "returns items for division and notes" do
      expect(described_class.search({"subject1" => "zz", "operator1" => "AND", "subject2" => "123"})).to contain_exactly(described_class2)
    end
  end
end
