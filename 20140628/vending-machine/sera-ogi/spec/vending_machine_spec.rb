require File.expand_path(File.dirname(__FILE__) + '/../vending_machine')

describe VendingMachine do
  describe 'step0' do

  	before do
      @vm = VendingMachine.new
  	end

  	it '初期状態では総額0円となっていること' do
      expect(@vm.total_money).to eq 0
    end

  	it '10円を1枚入れたら総額10円となっていること' do
      @vm.put_money= 10
      expect(@vm.total_money).to eq 10
    end

  	it '10円を2枚入れたら総額20円となっていること' do
      @vm.put_money= 10
      @vm.put_money= 10
      expect(@vm.total_money).to eq 20
    end

  	it '50円を1枚入れたら総額50円となっていること' do
      @vm.put_money= 50
      expect(@vm.total_money).to eq 50
    end

  	it '50円を2枚入れたら総額100円となっていること' do
      @vm.put_money= 50
      @vm.put_money= 50
      expect(@vm.total_money).to eq 100
    end

  	it 'n円を1枚入れたら総額n円となっていること' do
      moneys = [10, 50, 100, 500, 1000]
      moneys.each do |money|
        vm = VendingMachine.new
        vm.put_money= money
        expect(vm.total_money).to eq money
      end
    end

  	it 'n円を2枚入れたら総額n*2円となっていること' do
      moneys = [10, 50, 100, 500, 1000]
      moneys.each do |money|
        vm = VendingMachine.new
        vm.put_money= money
        vm.put_money= money
        expect(vm.total_money).to eq money*2
      end
    end

    it '総額n円を払い戻すとn円戻ってくる' do
      @vm.put_money= 10
      @vm.put_money= 10
      expect(@vm.return_money).to eq 20
    end
  end

end
