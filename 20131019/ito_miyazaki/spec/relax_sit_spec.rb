require 'spec_helper'

describe RelaxSit do
  describe "#come_and_go" do
    context "#2" do
      specify do
        expect(RelaxSit.new.come_and_go("1:A")).to eq "A"
      end
    end
    context "#3" do
      specify do
        expect(RelaxSit.new.come_and_go("1:Aa")).to eq "-"
      end
    end
  end
end
