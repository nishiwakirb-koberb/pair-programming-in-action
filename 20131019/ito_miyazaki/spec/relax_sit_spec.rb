require 'spec_helper'

describe RelaxSit do
  describe "#come_and_go" do
    subject { RelaxSit.new.come_and_go(input) }
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
  end
end
