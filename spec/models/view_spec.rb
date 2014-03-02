require 'spec_helper'

describe View do
  it { should belong_to(:user) }
  it { should belong_to(:slam_jam) }
end
