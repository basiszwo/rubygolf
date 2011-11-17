class Golf

  def self.hole1(array)
    array.inject(1) {|x, e| x *= e }
  end

  def self.hole2 sentence
    sentence.split(" ").sort {|x, y| x[1] <=> y[1] }.join(" ")
  end

  def self.hole3 number
    array = []
    until number == 1
      array << number
      number -= 1
    end
    array.inject(1) {|x, n| x *= n }
  end

  def self.hole4 array
    array.map{|x| self.wavecat(self.feed_bone(self.add_hat(x))) }
  end

  def self.hole5 array
    a, x = [], 1
    until x == array.length
      a += array.combination(x).to_a
      x += 1
    end
    a.uniq
  end

  def self.hole6 number
    counter, a = 1, []
    until counter > number
      case
      when (counter % 3 == 0) && (counter % 5 == 0)
        a << "fizzbuzz"
      when counter % 3 == 0
        a << "fizz"
      when counter % 5 == 0
        a << "buzz"
      else
        a << counter
      end
      counter += 1
    end
    a
  end

  def self.hole7 numbers
    inner_array, outer_array = [], []
    0.upto(numbers.size - 1) do |index|
      inner_array << numbers[index]
      if numbers[index+1] == numbers[index] + 1
        inner_array << numbers[index+1]
      else
        outer_array << reduce_consecutives(inner_array)
        inner_array = []
      end
    end
    outer_array
  end

  def self.hole8 number
    fibonacci(number)
  end

  def self.hole9 file
    rounds = self.get_rounds(file)
    p rounds
  end

  def self.get_rounds(file)
    rounds = []
    counters = {}

    f = File.open(file, "r")
    f.each_line do |line|
      line.split(",").each do |round|
        round.map{ |x| x.gsub(/\n/, '').strip }.each do |x|
          counters[x] = counters.has_key?(x) ? counters[x] = counters[x] + 1 : counters[x] = 1
        end
      end
    end

    p counters

  end


  private

    def self.add_hat man
      m = man.match(/(man\(.*\))/)
      m ? "hat(#{m})" : man
    end

    def self.feed_bone dog
      d = dog.match(/(dog\(.*\))/)
      d ? "#{d.to_s[0..-2]}(bone))" : dog
    end

    def self.wavecat cat
      cat.gsub(/cat/, "dead")
    end

    def self.reduce_consecutives array
      array.length > 1 ? "#{array.first}-#{array.last}" : array.to_s
    end

    def self.fibonacci(limit)
      a = [1,1]
      until a.length == limit
        a << a[a.length-2] + a[a.length-1]
      end
      a
    end

end
