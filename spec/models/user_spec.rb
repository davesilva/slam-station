require 'spec_helper'

describe User do
  it { should have_many(:views).dependent(:destroy) }
  it { should have_many(:slam_jams).through(:views) }

  describe "#slam!" do
    let(:user) { FactoryGirl.create(:user) }
    let(:slam_jam) { FactoryGirl.create(:slam_jam) }

    subject { -> { user.slam!(slam_jam) } }

    it { should change(View, :count).by(1) }
  end
end
