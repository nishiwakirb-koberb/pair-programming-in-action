require File.expand_path(File.dirname(__FILE__) + '/../vending_machine')

describe VendingMachine do
  let(:moneys){[10, 50, 100, 500, 1000]}
  let(:bad_moneys){[1, 5, 2000, 5000, 10000]}
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
      moneys.each do |money|
        vm = VendingMachine.new
        vm.put_money= money
        expect(vm.total_money).to eq money
      end
    end

  	it 'n円を2枚入れたら総額n*2円となっていること' do
      moneys.each do |money|
        vm = VendingMachine.new
        vm.put_money= money
        vm.put_money= money
        expect(vm.total_money).to eq money*2
      end
    end
    describe '払い戻す' do
      before do
        @vm.put_money= 10
        @vm.put_money= 10
        @vm.return_money
      end
      it '総額n円を払い戻すとn円戻ってくる' do
        expect(@vm.returned_money).to eq 20
      end
      it '総額が0円になっていること' do
        expect(@vm.total_money).to eq 0
      end
    end
  end

  describe 'step1' do
    describe '１円玉、５円玉、千円札以外のお札を投入した' do
      before do
        @vm = VendingMachine.new
      end
      it '投入金額に加算しないこと' do
        bad_moneys.each do |money|
          @vm.put_money= money
        end
        expect(@vm.total_money).to eq 0
       end
       it '投入金額と釣り銭が同じであること' do
         bad_moneys.each do |money|
           @vm.put_money= money
         end
         expect(@vm.returned_money).to eq bad_moneys.inject(:+)

       end
    end

  end

end
