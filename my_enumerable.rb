# frozen_string_literal: true

# Created my_enumerables and functions to use in the list.rb file
module MyEnumerable
  def all?(&block)
    each { |value| return false unless block.call(value) }
    true
  end

  def any?(&block)
    each { |value| return true if block.call(value) }
    false
  end

  def filter(&block)
    result = []
    each { |value| result << value if block.call(value) }
    result
  end
end
