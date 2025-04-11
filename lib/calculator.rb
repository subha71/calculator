class Calculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiter = ',|\n'
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..-1])
      numbers = parts[1]
    end
    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = nums.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?
    nums.sum
  end
end