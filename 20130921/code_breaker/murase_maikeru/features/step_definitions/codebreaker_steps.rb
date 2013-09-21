Given /^the secret code is "([^\"]*)"$/ do |secret|
  @game = Codebreaker::Game.new(output)
  @game.start(secret)
end

When /^I guess "([^\"]*)"$/ do |guess|
  @guess = guess
end

Then /^the mark should be "([^\"]*)"$/ do |mark|
  @game.guess(@guess).should == mark
end

