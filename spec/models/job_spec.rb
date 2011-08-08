require 'spec_helper'

describe Job do
  describe "#valid" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe ".active" do
    it "should only return active jobs" do
      active_job = Factory(:job)
      Factory(:job, :active => FALSE)

      Job.all.count.should == 2
      Job.active.should == [active_job]
    end
  end
end
