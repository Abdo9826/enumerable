# frozen_string_literal: true

require_relative 'my_enumerable'

# Created a new class called List that inherits from MyEnumerable
class MyList
  include MyEnumerable

  def initialize(*list)
    @list = list
  end

  def each
    return to_enum(:each) unless block_given?

    counter = 0
    while counter < @list.length
      yield(@list[counter])
      counter += 1
    end
    @list
  end
end

list = MyList.new(1, 2, 3, 4)

puts(list.all? { |e| e < 5 }) # true
puts(list.all? { |e| e > 5 }) # false

puts(list.any? { |e| e == 2 }) # true
puts(list.any? { |e| e == 5 }) # false

list.filter(&:even?) # [2,4]
