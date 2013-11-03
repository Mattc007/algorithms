module NQueens
  class Solver
    def self.solve(n=8, show_board=true)
      raise if n < 1

      t1 = Time.now
      solutions = 0
      attempts = 0
      columns = Array(1..n)
      
      columns.permutation(n).each do |vector|
        attempts += 1
        positive_diagonals = columns.map { |i| vector[i-1] + i }
        negative_diagonals = columns.map { |i| vector[i-1] - i }
        if n == positive_diagonals.uniq.length \
           && n == negative_diagonals.uniq.length
          print(vector, n) if show_board
          solutions += 1
        end
      end

      puts "n=#{n}: #{solutions} distinct solutions (#{attempts} combinations) - #{Time.now - t1}s"
    end

    private

    def self.print(vector, n)
      vector.each { |i| puts "#{'| ' * (i-1)}|Q#{'| ' * (n - i)}|" }
      puts ""
    end
  end
end

# 2.0.0 (NQueens::Solver):4 > 1.upto(8).each { |n| solve n, false }
# n=1: 1 distinct solutions (1 combinations) - 1.5e-05s
# n=2: 0 distinct solutions (2 combinations) - 1.5e-05s
# n=3: 0 distinct solutions (6 combinations) - 2.2e-05s
# n=4: 2 distinct solutions (24 combinations) - 0.000144s
# n=5: 10 distinct solutions (120 combinations) - 0.000459s
# n=6: 4 distinct solutions (720 combinations) - 0.002563s
# n=7: 40 distinct solutions (5040 combinations) - 0.032933s
# n=8: 92 distinct solutions (40320 combinations) - 0.198113s
