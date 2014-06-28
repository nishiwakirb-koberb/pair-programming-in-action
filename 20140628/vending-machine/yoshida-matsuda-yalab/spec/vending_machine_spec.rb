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
    expect(vending_machine.refund).to eq answer
    expect(vending_machine.total).to eq 0
  end

  it "1円玉が投入されたら金額に加算しない" do
    answer = 0
    expect(vending_machine.input(1)).to eq false
    expect(vending_machine.total).to eq answer
  end

  it "5円玉が投入されたら金額に加算しない" do
    answer = 0
    expect(vending_machine.input(5)).to eq false
    expect(vending_machine.total).to eq answer
  end

  it "2000円冊が投入されたら金額に加算しない" do
    answer = 0
    expect(vending_machine.input(2000)).to eq false
    expect(vending_machine.total).to eq answer
  end

  it "1本120円のコーラが5本入ってる" do
    stock = vending_machine.stock
    expect(stock.size).to eq 5
    stock.each do |drink|
      expect(drink.name).to eq 'cola'
      expect(drink.price).to eq 120
    end
  end

  it "コーラの購入ができるか判定を行う" do
    vending_machine.input(100)
    vending_machine.input(10)
    expect(vending_machine.can_buy?('cola')).to eq false
    vending_machine.input(10)
    expect(!!vending_machine.can_buy?('cola')).to eq true

  end

  context "ジュースを購入する" do
    it "ジュースを購入する" do
      vending_machine.input(100)
      vending_machine.input(50)
      expect(vending.machine.purchase('cola')).to eq true


    end

    it "売り上げ金額を取得する" do
      sales= 120
      vending_machine.input(100)
      vending_machine.input(50)
      vending_machine.purcase('cola')
      expect(vending_machine.sale).to eq sales
    end

    it "払い戻し操作をする" do
      total = 30
      vending_machine.input(100)
      vending_machine.input(50)
      vending_machine.purcase('cola')
      expect(vending_machine.refund).to eq total
    end
  end
end
