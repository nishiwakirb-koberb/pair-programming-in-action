require File.expand_path('../vending_machine', File.dirname(__FILE__))

describe VendingMachine do
  let (:vending_machine) { VendingMachine.new }

  describe "#initialize" do
    it "has 5 cokes" do
      cokes = vending_machine.drinks.select{|drink| drink.name == "コーラ"}
      expect(cokes.size).to eq 5
    end
  end

  describe "#add" do
    context "money is valid?" do
      it "100YEN + 10YEN return 110YEN" do
        vending_machine.add 100
        vending_machine.add 10
        expect(vending_machine.amount).to eq 110
      end

      it "return nil" do
        expect(vending_machine.add(10)).to be_nil
      end
    end

    context "money is invalid?" do
      it "return money with no aciton" do
        expect(vending_machine.add(2000)).to eq 2000
      end
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
