require 'rails_helper'

RSpec.describe AudioVisual, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :item }
    it { is_expected.to respond_to :box }
    it { is_expected.to respond_to :topic }
    it { is_expected.to respond_to :creator }
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :year }
    it { is_expected.to respond_to :format }
    it { is_expected.to respond_to :color }
    it { is_expected.to respond_to :duration }
    it { is_expected.to respond_to :copied }
    it { is_expected.to respond_to :notes }
    it { is_expected.to respond_to :id3 }
    it { is_expected.to respond_to :index }
  end


  describe "search" do
    let(:described_class1) { described_class.create(title: "II1", creator: "T1", notes: "Red")}
    let(:described_class2) { described_class.create(title: "A16", creator: "II12", notes: "Green")}
    let(:described_class3) { described_class.create(title: "A26", creator: "II33", notes: "Blue")}
    before do
      described_class1
      described_class2
      described_class3
    end
    it "returns items for title" do
      expect(described_class.search({"keyword1" => "A1"})).to contain_exactly(described_class2)
    end

    it "returns items for creator or title" do
      expect(described_class.search({"keyword1" => "II"})).to contain_exactly(described_class1, described_class2, described_class3)
    end

    it "returns items for notes" do
      expect(described_class.search({"keyword1" => "blue"})).to contain_exactly(described_class3)
    end

    it "returns items for creator and notes" do
      expect(described_class.search({"keyword1" => "II", "operator1" => "and", "keyword2" => "green"})).to contain_exactly(described_class2)
    end
  end
end
