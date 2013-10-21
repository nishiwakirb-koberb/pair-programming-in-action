require 'pry-byebug'
require 'byebug'

class ChairRule
  attr_reader :result

  def initialize orders
    number, people = parse orders
    chairs = Array.new(number) { Chair.new }
    update_chairs people, chairs
    @result = chairs.map(&:state).join
  end

  def parse orders
    [orders.split(':').first.to_i, orders.split(':').last.split(//)]
  end

  def update_chairs people, chairs
    people.each do |person|
      exit?(person) ?
        chairs.first.empty! : chairs.first.update!(person)
    end
  end

  def exit? person
    person == person.downcase
  end

  class Chair
    attr_reader :state

    def initialize
      empty!
    end

    def update! person
      @state = person
    end

    def empty!
      @state = '-'
    end
  end
end

