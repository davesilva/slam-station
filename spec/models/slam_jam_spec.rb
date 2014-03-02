require 'spec_helper'

describe SlamJam do
  it { should have_many(:views).dependent(:destroy) }
  it { should have_many(:users).through(:views) }

  describe "#unwatched_by" do
    let(:view) { FactoryGirl.create(:view) }
    let(:user) { view.user }
    let(:watched) { view.slam_jam }
    let(:unwatched) { FactoryGirl.create(:slam_jam) }

    subject { SlamJam.unwatched_by(user) }

    it { should include unwatched }
    it { should_not include watched }
  end

  describe "#curated" do
    let(:approved) { FactoryGirl.create(:slam_jam, :approved => true) }
    let(:unapproved) { FactoryGirl.create(:slam_jam) }

    subject { SlamJam.curated }

    it { should include approved }
    it { should_not include unapproved }
  end

  describe "#nth" do
    before { 5.times { FactoryGirl.create(:slam_jam) } }

    subject { SlamJam.nth(3) }

    it { should == SlamJam.all[3] }
  end

  describe "#random" do
    before { 5.times { FactoryGirl.create(:slam_jam) } }

    subject { SlamJam.random }

    it { should_not be_nil }
    specify { SlamJam.all.should include SlamJam.random }
  end
end
