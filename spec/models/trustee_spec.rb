require 'rails_helper'

RSpec.describe Trustee, type: :model do
  subject { described_class.new }
  describe "responds to attributes" do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :access_id }
    it { is_expected.to respond_to :full_name }
    it { is_expected.to respond_to :trustee_type }
    it { is_expected.to respond_to :dates_of_service }
    it { is_expected.to respond_to :university_status }
    it { is_expected.to respond_to :first_year }
  end

  describe "search" do
    let(:described_class1) { described_class.create(access_id: "1", full_name: "Sally", trustee_type: 1928, university_status: "No", dates_of_service: "No")}
    let(:described_class2) { described_class.create(access_id: "16", full_name: "Joe", trustee_type: 1944, university_status: "No", dates_of_service: "No")}
    let(:described_class3) { described_class.create(access_id: "26", full_name: "Jane", trustee_type: 1977, university_status: "No", dates_of_service: "No")}
    before do
      described_class1
      described_class2
      described_class3
    end
    
    it "returns items for full name" do
      expect(described_class.search({"full_name" => "SALLY"})).to contain_exactly(described_class1)
    end

    it "returns items for trustee_type" do
      expect(described_class.search({"trustee_type" => "77"})).to contain_exactly(described_class3)
    end


    it "returns items for full_name and trustee_type" do
      expect(described_class.search({"full_name" => "JANE", "trustee_type" => "77"})).to contain_exactly(described_class3)
    end
  end
end
