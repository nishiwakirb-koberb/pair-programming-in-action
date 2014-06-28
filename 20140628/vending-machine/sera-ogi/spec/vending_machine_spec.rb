require File.expand_path(File.dirname(__FILE__) + '/../vending_machine')

describe VendingMachine do
  describe 'step0' do

  	before do
      @vm = VendingMachine.new
  	end

  	it '10円入れたら総額10円となっていること' do
      @vm.put_money= 10
      expect(@vm.total_money).to eq 10
    end
  end

end