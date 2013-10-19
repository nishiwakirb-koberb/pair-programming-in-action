class RelaxSit
  def self.come_and_go(input)
    self.new(*input.split(':')).process
  end

  def initialize(chair_count, people)
    @chairs = create_chairs(chair_count.to_i)
    @people = people.chars
  end

  def process
    @people.each {|person| sit_or_leave(person) }
    @chairs.join
  end

  private

  def sit_or_leave(person)
    love_to_sit?(person) ? best_vacant_chair.sit(person) : chair_seated_by(person).leave
  end

  def create_chairs(chair_count)
    Array.new(chair_count){ Chair.new }.tap(&method(:refer_neighbors))
  end
  
  def refer_neighbors(chairs)
    chairs.each_cons(2) do |left_chair, right_chair|
      right_chair.prev_chair = left_chair
      left_chair.next_chair = right_chair
    end
  end

  def love_to_sit?(person)
    person.match(/[A-Z]/)
  end

  def best_vacant_chair
    @chairs.reject(&:seated?).max_by(&:side_vacant_count)
  end

  def chair_seated_by(person)
    @chairs.find{|chair| chair.seated_by?(person) }
  end

  class Chair
    attr_accessor :prev_chair, :next_chair
    attr_reader :seated_person

    def sit(person)
      @seated_person = person
    end

    def leave
      @seated_person = nil
    end

    def seated?
      !seated_person.nil?
    end

    def seated_by?(person)
      seated_person == person.upcase
    end

    # 両側空き = 2, 片側空き = 1, 両側空きなし = 0
    def side_vacant_count
      [prev_chair, next_chair].count{|chair| chair.nil? || !chair.seated? }
    end

    def to_s
      seated_person || '-'
    end
  end
end
