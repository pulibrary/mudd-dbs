require 'rails_helper'

RSpec.describe Memorial, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :publication }
    it { is_expected.to respond_to :volume }
    it { is_expected.to respond_to :no }
    it { is_expected.to respond_to :publish_date }
    it { is_expected.to respond_to :article_type }
    it { is_expected.to respond_to :subject }
    it { is_expected.to respond_to :class_year }
    it { is_expected.to respond_to :class_grade }
    it { is_expected.to respond_to :page }
  end

  describe "search" do
    let(:described_class1) { described_class.create(class_year: 1928, subject: "No", class_grade: "No")}
    let(:described_class2) { described_class.create(class_year: 1944, subject: "No", class_grade: "No")}
    let(:described_class3) { described_class.create(class_year: 1977, subject: "No", class_grade: "YES")}
    before do
      described_class1
      described_class2
      described_class3
    end

    it "returns items for class_year" do
      expect(described_class.search({"class_year" => "77"})).to contain_exactly(described_class3)
    end

    it "returns items for subject" do
      expect(described_class.search({"subject" => "yes"})).to be_empty
    end

    it "returns items for class_grade" do
      expect(described_class.search({"class_grade" => "no"})).to contain_exactly(described_class1, described_class2)
    end

    it "returns items for class_grade and subject" do
      expect(described_class.search({"subject" => "no", "class_grade" => "yes"})).to contain_exactly(described_class3)
    end
  end
end
