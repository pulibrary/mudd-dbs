require 'rails_helper'

RSpec.describe Archboard, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :numbers_assigned }
    it { is_expected.to respond_to :original_assigned }
    it { is_expected.to respond_to :building_info_sheet }
    it { is_expected.to respond_to :drawing_title }
    it { is_expected.to respond_to :drawing_number }
    it { is_expected.to respond_to :project_type }
    it { is_expected.to respond_to :drawing_type }
    it { is_expected.to respond_to :board_date }
    it { is_expected.to respond_to :board_dimensions }
    it { is_expected.to respond_to :color }
    it { is_expected.to respond_to :drawing_view }
    it { is_expected.to respond_to :elevation }
    it { is_expected.to respond_to :comments }
    it { is_expected.to respond_to :contractor1_type }
    it { is_expected.to respond_to :contractor1_name }
    it { is_expected.to respond_to :contractor2_type }
    it { is_expected.to respond_to :contractor2_name }
    it { is_expected.to respond_to :contractor3_type }
    it { is_expected.to respond_to :contractor3_name }
    it { is_expected.to respond_to :proposal }
    it { is_expected.to respond_to :not_constructed }
    it { is_expected.to respond_to :bw_fiche }
  end


  describe "search" do
    let(:described_class1) { described_class.create(drawing_title: "zz", building_info_sheet: "building ff", contractor1_name: "fred", elevation: "Yes", comments: "Here", contractor1_type: "good")}
    let(:described_class2) { described_class.create(drawing_title: "ZZ", building_info_sheet: "building ff123", contractor1_name: "Jill", elevation: "Yes", comments: "There", contractor1_type: "bad")}
    let(:described_class3) { described_class.create(drawing_title: "CC", building_info_sheet: "Jane", contractor1_name: "Jane", elevation: "No", comments: "Every", contractor1_type: "average")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for building_info_sheet" do
      expect(described_class.search({"subject1" => "FF"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for original_assigned" do
      expect(described_class.search({"subject1" => "zz"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for contractor1_name" do
      expect(described_class.search({"subject1" => "jill"})).to contain_exactly(described_class2)
    end

    it "returns items for elevation" do
      expect(described_class.search({"subject1" => "no"})).to contain_exactly(described_class3)
    end

    it "returns items for comments" do
      expect(described_class.search({"subject1" => "every"})).to contain_exactly(described_class3)
    end

    it "returns items for contractor1_type" do
      expect(described_class.search({"subject1" => "bad"})).to contain_exactly(described_class2)
    end

    it "returns items for contractor1_type and drawing_title" do
      expect(described_class.search({"subject1" => "zz", "operator1" => "AND", "subject2" => "123"})).to contain_exactly(described_class2)
    end
  end
end
