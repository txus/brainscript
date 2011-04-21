require 'test_helper'

class CompilerTest < MiniTest::Unit::TestCase

  def test_simple_addition
    assert_evaluates />\[-<\+>\]</, '1 + 2'
  end

end
