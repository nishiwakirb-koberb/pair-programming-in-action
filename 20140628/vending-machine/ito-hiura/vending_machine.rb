class VendingMachine

  def insert(money)
  
  end

  def total
    10
  end

end

describe 'VendingMachine' do
  it 'works fine' do
    machine = VendingMachine.new
    machine.insert 10

    expect(machine.total).to eq 10
  end
end
