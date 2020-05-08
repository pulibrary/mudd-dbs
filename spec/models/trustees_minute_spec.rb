require 'rails_helper'

RSpec.describe TrusteesMinute, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :access_id }
    it { is_expected.to respond_to :subject }
    it { is_expected.to respond_to :volume }
    it { is_expected.to respond_to :page }
  end

  describe "search" do
    let(:described_class1) { described_class.create(access_id: "II1", subject: "T1", page: "Red")}
    let(:described_class2) { described_class.create(access_id: "A16", subject: "II12", page: "Green")}
    let(:described_class3) { described_class.create(access_id: "A26", subject: "II33", page: "Blue")}
    before do
      described_class1
      described_class2
      described_class3
    end

    it "returns items for subject" do
      expect(described_class.search({"subject1" => "II"})).to contain_exactly(described_class2, described_class3)
    end

    it "returns items for page" do
      expect(described_class.search({"subject1" => "blue"})).to contain_exactly(described_class3)
    end

    it "returns items for subject and page" do
      expect(described_class.search({"subject1" => "II", "operator1" => "and", "subject2" => "green"})).to contain_exactly(described_class2)
    end
  end
end
