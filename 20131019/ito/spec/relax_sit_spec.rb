require 'spec_helper'

describe RelaxSit do
  describe "#come_and_go" do
    subject { RelaxSit.come_and_go(input) }
    shared_examples_for 'valid result' do
      specify do
        expect(subject).to eq result
      end
    end
    context "#2" do
      let(:input) { '1:A' }
      let(:result) { 'A' }
      it_behaves_like 'valid result'
    end
    context "#3" do
      let(:input) { '1:Aa' }
      let(:result) { '-' }
      it_behaves_like 'valid result'
    end
    context "#4" do
      let(:input) { '2:AB' }
      let(:result) { 'AB' }
      it_behaves_like 'valid result'
    end
    context "#5" do
      let(:input) { '2:AaB' }
      let(:result) { 'B-' }
      it_behaves_like 'valid result'
    end
    context "#6" do
      let(:input) { '2:AZa' }
      let(:result) { '-Z' }
      it_behaves_like 'valid result'
    end
     context "#7" do
      let(:input) { '2:AZz' }
      let(:result) { 'A-' }
      it_behaves_like 'valid result'
    end
    context "#8" do
      let(:input) { '3:ABC' }
      let(:result) { 'ACB' }
      it_behaves_like 'valid result'
    end
    context "#9" do
      let(:input) { '3:ABCa' }
      let(:result) { '-CB' }
      it_behaves_like 'valid result'
    end
    context "#10" do
      let(:input) { '4:ABCD' }
      let(:result) { 'ADBC' }
      it_behaves_like 'valid result'
    end
    specify 'the rest' do
      expect(RelaxSit.come_and_go("4:ABCD")).to eq "ADBC"
      expect(RelaxSit.come_and_go("4:ABCbBD")).to eq "ABDC"
      expect(RelaxSit.come_and_go("4:ABCDabcA")).to eq "-D-A"
      expect(RelaxSit.come_and_go("5:NEXUS")).to eq "NUESX"
      expect(RelaxSit.come_and_go("5:ZYQMyqY")).to eq "ZM-Y-"
      expect(RelaxSit.come_and_go("5:ABCDbdXYc")).to eq "AYX--"
      expect(RelaxSit.come_and_go("6:FUTSAL")).to eq "FAULTS"
      expect(RelaxSit.come_and_go("6:ABCDEbcBC")).to eq "AECB-D"
      expect(RelaxSit.come_and_go("7:FMTOWNS")).to eq "FWMNTSO"
      expect(RelaxSit.come_and_go("7:ABCDEFGabcdfXYZ")).to eq "YE-X-GZ"
      expect(RelaxSit.come_and_go("10:ABCDEFGHIJ")).to eq "AGBHCIDJEF"
    end
  end
end
