# AST nodes
module Brainscript::AST
  class IntLit < Struct.new(:int)
    def compile
      "+" * int
    end
  end
  
  class Expression < Struct.new(:left, :op, :right)
    OPS = { 
      '+' => 'add',
      '-' => 'sub',
      '*' => 'mul',
      '/' => 'div'
    }

    def compile
      self.send OPS[op.to_s], left.compile, right.compile
    end

    def add(l, r)
      out = []
      out << "# Assign a"
      out << l
      out << "# Assign b"
      out << ">" + r + "<"
      out << "# Compute sum"
      out << ">[-<+>]<"
      out.join("\n")
    end

    def add(l, r)
      out = []
      out << "# Assign a"
      out << l
      out << "# Assign b"
      out << ">" + r + "<"
      out << "# Compute sum"
      out << ">[-<+>]<"
      out.join("\n")
    end
  end
  
  class Assign < Struct.new(:ident, :exp)
  end
end
