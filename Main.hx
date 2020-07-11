import hscript.Parser.Parser;
import hscript.Expr.Expr;
import hscript.Interp.Interp;

/* Simple class that has a function that returns a value */
class SimpleIntGetter {
  private var _value:Int;
  public function new (value:Int) {
    _value = value;
  }
  public function getValue() {
    return _value;
  }
}

class Main {
  static public function main():Void {
    // Test variables
    var a = new SimpleIntGetter(10);
    var b = 5;

    // Put the getter class instance in an array
    var list:Array<SimpleIntGetter> = [a];

    // Calculate this simple expression in Haxe
    trace("Expression: list[0].getValue() - b / 2");
    var haxeResult1 = list[0].getValue() - b / 2;
    trace("Expected value: " + haxeResult1);
    
    // Calculate the same expression in hscript
    var script1 = '
    var result = list[0].getValue() - b / 2;
    result';
    var parser1:Parser = new Parser();
    var expr1:Expr = parser1.parseString(script1);
    var interp1:Interp = new Interp();
    interp1.variables.set('list', list);
    interp1.variables.set('a', a);
    interp1.variables.set('b', b);
    var hscriptResult1 = interp1.execute(expr1);
    trace("Interpreted value: " + hscriptResult1);
  }
}