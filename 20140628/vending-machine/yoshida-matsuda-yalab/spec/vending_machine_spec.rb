# -*- coding: utf-8 -*-
require File.expand_path('../spec_helper', __FILE__)

RSpec.describe VendingMachine do

  let (:vending_machine) do
    VendingMachine.new()
  end

  it "10円玉を投入できる" do
    answer = true
    expect(vending_machine.input(10)).to eq answer
  end

  it "50円玉を投入できる" do
    answer = true
    expect(vending_machine.input(50)).to eq answer
  end

  it "100円玉を投入できる" do
    answer = true
    expect(vending_machine.input(100)).to eq answer
  end

  it "5000円玉を投入できる" do
    answer = true
    expect(vending_machine.input(500)).to eq answer
  end

  it "1000円札を投入できる" do
    answer = true
    expect(vending_machine.input(1000)).to eq answer
  end

  it "連続で投入する" do
    answer = true
    expect(vending_machine.input(10)).to eq answer
    expect(vending_machine.input(10)).to eq answer
  end

  it "投入金額の合計を取得できる" do
    answer = 60
    vending_machine.input(10)
    vending_machine.input(50)
    expect(vending_machine.total).to eq answer
    coin = 100
    vending_machine.input(coin)
    expect(vending_machine.total).to eq answer + coin
  end

  it "払い戻し操作ができる" do
    answer = 60
    vending_machine.input(10)
    vending_machine.input(50)
    expect(vending_machine.refound).to eq answer
  end

  it "1円玉が投入されたら金額に加算しない" do
    answer = 0
    vending_machine.input(1)
    expect(vending_machine.total).to eq answer
  end
end
