require File.expand_path('../vending_machine', File.dirname(__FILE__))

describe VendingMachine do
  let (:vending_machine) { VendingMachine.new }

  describe "#add" do
    it "100YEN + 10YEN return 110YEN" do
      vending_machine.add 100
      vending_machine.add 10
      expect(vending_machine.amount).to eq 110
    end
  end

  describe "#repay" do
    context "vending_machine has 100YEN" do
      before :each do
        vending_machine.add 100
      end

      it "return amount and empty" do
        expect(vending_machine.repay).to eq 100
        expect(vending_machine.amount).to eq 0
      end
    end
  end
end
