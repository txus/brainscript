# The entry point and main controller. 
#
class Brainscript::Compiler
  
  # Compiles source and returns compilation result.
  #
  # @param <String> the source code.
  def compile(source)
    ast = transformer.apply(parser.parse(source))
    result = ast.compile.to_s
    puts result
    result
  end 

  private

  def parser
    Brainscript::Parser.new
  end

  def transformer
    Brainscript::Transform.new
  end
  
end
