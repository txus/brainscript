require 'test_helper'

class TransformTest < MiniTest::Unit::TestCase

  include Brainscript::AST

  def test_integer_literals
    assert_equal IntLit.new(1), transform(int: 1)
  end

  def test_arithmetic_expressions
    assert_equal Expression.new('l', '+', 'r'), transform(left: 'l', op: '+', right: 'r')
  end

  def test_assignments
    assert_equal Assign.new('a', 'e'), transform(ident: 'a', exp: 'e')
  end

end
