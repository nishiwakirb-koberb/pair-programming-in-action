Given /^the secret code is "([^\"]*)"$/ do |secret|
  @game = Codebreaker::Game.new
  @game.start(secret)
end

When /^I guess "([^\"]*)"$/ do |guess|
  @guess = guess
end

Then /^the mark should be "([^\"]*)"$/ do |mark|
  @game.judge(@guess).should == mark
end

