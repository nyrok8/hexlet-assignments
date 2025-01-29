# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

require 'minitest/autorun'

class StackTest < Minitest::Test
  # BEGIN
  def test_push!
    stack = Stack.new([3, 2])
    stack.push!(1)
    assert_equal stack.to_a, [3, 2, 1]
  end

  def test_pop!
    stack = Stack.new([3, 2])
    stack.pop!
    assert_equal stack.to_a, [3]
  end

  def test_clear!
    stack = Stack.new([3, 2])
    stack.clear!
    assert_equal stack.to_a, []
  end

  def test_empty?
    stack = Stack.new([])
    assert stack.empty?
    stack.push!(1)
    refute stack.empty?
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
