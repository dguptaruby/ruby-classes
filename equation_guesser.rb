class EquationGuesser

  def initialize(operands, desired_output)
    @guess_results = []
    @operands_values = operands
    @equation_result = desired_output 
  end
  
  def output?
    equation = equation_genrator
    result = eval(equation)
    @guess_results << { equation: equation, result: result, result_diff: (@equation_result - result) }
    (@equation_result == result)
  end

  def equation_genrator
    @operands_values[0..-2].collect{|i| "#{i}#{["+","-","*","/"].sample}" }.join("") << @operands_values.last.to_s
  end

  def display_result
    best_guess = @guess_results.sort_by{ |hsh| hsh[:result_diff] }.first
    puts "Guesses: #{@guess_results.count} Best Guess: #{best_guess[:equation]} = #{best_guess[:result]} (#{best_guess[:result_diff]})"
  end

  def guesses(guess)
    while @guess_results.count < guess do
      break if output? 
    end  
    display_result
  end
end

eq = EquationGuesser.new([1,2,3,4],24)
eq.guesses(5)
