gem 'minitest'
require 'minitest/autorun'
require 'mocha'

require 'brainscript'

module CompilerAssertions

  def assert_evaluates(expected, code)
    if expected.is_a?(Regexp)
      assert_match expected, compiler.compile(code)
    else
      assert_equal expected, strip_code(compiler.compile(code))
    end
  end

  private

  def compiler
    Brainscript::Compiler.new
  end

  def strip_code(code)
    symbols = %w(+ - > < . , [ ])
    code.each_char.to_a.select do |c|
      symbols.include? c
    end.join
  end
end

module ParserAssertions

  def tokenizes(input, options = {})
    as = options.delete(:as)
    caller.first.match /`(.*)\'/
    rule = $1.split("_")[1..-1].join("_").to_sym

    im = parser.send(rule).parse(input)

    as.nil? ? refute_nil(im)
            : assert_equal(as, im)
  rescue Parslet::ParseFailed
    flunk "#{rule} rule could not tokenize #{input}"
  end

  private

  def parser
    Brainscript::Parser.new
  end
end

module TransformAssertions

  def transform(tree)
    Brainscript::Transform.new.apply(tree)
  end

end

class MiniTest::Unit::TestCase
  include CompilerAssertions
  include ParserAssertions
  include TransformAssertions
end
