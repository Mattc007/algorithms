module Hanoi
  class Recursive

    def initialize(plates = 5)
      @b, @c = [], []
      @a = (1..plates).to_a
      @moves = 0
    end

    def run
      t1 = Time.now
      draw
      move(@a.length, @a, @c, @b)

      puts "took #{@moves} moves and #{Time.now - t1}s"
    end

    private

    def move(plates, start, target, using)
      if plates == 1
        target << start.pop
        @moves += 1
        draw
      else
        move(plates-1, start, using, target)
        move(1, start, target, using)
        move(plates-1, using, target, start)
      end
    end

    def draw
      puts "#{@moves} : #{@a} | #{@b} | #{@c}"
    end

  end
end
