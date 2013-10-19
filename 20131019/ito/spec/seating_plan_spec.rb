require 'spec_helper'

describe SeatingPlan do
  describe "#sit_and_leave" do
    subject { SeatingPlan.sit_and_leave(input) }
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
      expect(SeatingPlan.sit_and_leave("4:ABCD")).to eq "ADBC"
      expect(SeatingPlan.sit_and_leave("4:ABCbBD")).to eq "ABDC"
      expect(SeatingPlan.sit_and_leave("4:ABCDabcA")).to eq "-D-A"
      expect(SeatingPlan.sit_and_leave("5:NEXUS")).to eq "NUESX"
      expect(SeatingPlan.sit_and_leave("5:ZYQMyqY")).to eq "ZM-Y-"
      expect(SeatingPlan.sit_and_leave("5:ABCDbdXYc")).to eq "AYX--"
      expect(SeatingPlan.sit_and_leave("6:FUTSAL")).to eq "FAULTS"
      expect(SeatingPlan.sit_and_leave("6:ABCDEbcBC")).to eq "AECB-D"
      expect(SeatingPlan.sit_and_leave("7:FMTOWNS")).to eq "FWMNTSO"
      expect(SeatingPlan.sit_and_leave("7:ABCDEFGabcdfXYZ")).to eq "YE-X-GZ"
      expect(SeatingPlan.sit_and_leave("10:ABCDEFGHIJ")).to eq "AGBHCIDJEF"
    end
  end
end
