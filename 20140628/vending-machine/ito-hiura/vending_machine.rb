class VendingMachine
  def initialize
    @total = 0
  end
  def insert(money)
    @total = @total + money
  end

  def total
    @total
  end

end

describe 'VendingMachine' do
  it 'works fine' do
    machine = VendingMachine.new
    expect(machine.total).to eq 0
    machine.insert 10
    machine.insert 1000

    expect(machine.total).to eq 1010
  end
end
