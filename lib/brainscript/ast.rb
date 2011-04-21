# AST nodes
module Brainscript::AST
  class IntLit < Struct.new(:int)
    def compile
      int
    end
  end
  
  class Expression < Struct.new(:left, :op, :right)
    def compile
      left.compile.send(op, right.compile)
    end
  end
  
  class Assign < Struct.new(:ident, :exp)
  end
end
