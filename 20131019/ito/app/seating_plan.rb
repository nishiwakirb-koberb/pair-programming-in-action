class SeatingPlan
  def self.sit_and_leave(input)
    self.new(*input.split(':')).sit_and_leave
  end

  def initialize(chair_count, people)
    @chairs = create_chairs(chair_count.to_i)
    @people = people.chars
  end

  def sit_and_leave
    @people.each(&method(:sit_or_leave))
    @chairs.join
  end

  private

  def create_chairs(chair_count)
    Array.new(chair_count){ Chair.new }.tap(&method(:refer_neighbors))
  end
  
  def refer_neighbors(chairs)
    chairs.each_cons(2) do |left_chair, right_chair|
      right_chair.prev_chair = left_chair
      left_chair.next_chair = right_chair
    end
  end

  def sit_or_leave(person)
    person.love_to_sit? ?
      find_best_vacant_chair.sit(person) :
      find_seated_chair(person).leave
  end

  def find_best_vacant_chair
    @chairs.reject(&:seated?).max_by(&:neighbors_vacant_count)
  end

  def find_seated_chair(person)
    @chairs.find{|chair| chair.seated_by?(person) }
  end

  class ::String
    def love_to_sit?
      self.match(/[A-Z]/)
    end
  end

  class Chair
    attr_accessor :prev_chair, :next_chair

    def sit(person)
      @seated_person = person
    end

    def leave
      @seated_person = nil
    end

    def seated?
      !@seated_person.nil?
    end

    def seated_by?(person)
      @seated_person == person.upcase
    end

    def neighbors_vacant_count
      # 両側空き = 2, 片側空き = 1, 両側空きなし = 0
      neighbors.count(&method(:vacant?))
    end

    def to_s
      @seated_person || '-'
    end

    private

    def neighbors
      [prev_chair, next_chair]
    end
    
    def vacant?(chair)
      chair.nil? || !chair.seated?
    end
  end
end
