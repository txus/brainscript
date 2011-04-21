require 'test_helper'

class ParserTest < MiniTest::Unit::TestCase

  def test_expression
    tokenizes '1+2', as: {left: {int: '1'}, right: {int: '2'}, op: '+'}
    tokenizes '1-2', as: {left: {int: '1'}, right: {int: '2'}, op: '-'}
    tokenizes '1 * 2', as: {left: {int: '1'}, right: {int: '2'}, op: '*'}
    tokenizes '1 / 2', as: {left: {int: '1'}, right: {int: '2'}, op: '/'}

    tokenizes '1*2 + 3'
    tokenizes '1 * (1 + 3)'
  end

  def test_assignment
    tokenizes 'a = 1', as: {ident: 'a', exp: {int: '1'}}
  end

end
