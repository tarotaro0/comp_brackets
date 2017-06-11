n = gets.to_i
s = gets.chars

stack = []

n.times do |i|
  if s[i] == '('
    stack.push '('
  else
    if left_index = stack.rindex('(')
      create_stack = [')']
      (stack.length - left_index).times do |i|
        create_stack.push stack.pop
      end
      stack.push create_stack.reverse.join('')
    else
      stack.push ')'
    end
  end
end

stack.count(')').times do |i|
  right_index = stack.index(')')
  create_stack = ['(']
  (right_index+1).times do |j|
    create_stack.push stack.shift
  end
  stack.unshift create_stack.join('')
end

stack.count('(').times do |i|
  left_index = stack.rindex('(')
  create_stack = [')']
  (stack.length - left_index).times do |i|
    create_stack.push stack.pop
  end
  stack.push create_stack.reverse.join('')
end

puts stack.join('')