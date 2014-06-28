class VendingMachine
  def initialize
    @total = 0
    @money = 0
  end
  
  def insert(money)
    @total += money
  end

  def total
    @total
  end
  
  def refund
    @money = @total
    @total = 0
    @money
  end
end

describe 'VendingMachine' do
  it 'works fine' do
    machine = VendingMachine.new
    expect(machine.total).to eq 0
    machine.insert 10
    machine.insert 1000

    expect(machine.total).to eq 1010
    expect(machine.refund).to eq 1010
    expect(machine.total).to eq 0
  end
end
