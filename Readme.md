# HScript Order of Operations Bug

hscript has a bug on its master branch that breaks order of operations for certain expressions. The issue seems mostly limited to operations that have array values w/ getter methods in their expressions (e.g. `list[0].getValue()`). This type of expression causes an order of operations malfunction when it is a part of a larger mathematical operation. (e.g. `list[0].getValue() - b / 2`). One workaround is to force the order of operations via parentheses. This issue does not affect the latest `2.4.0` tag, just `master`.

Run the commands below to see a demonstration of the issue:

```bash
# Set up local haxelibs
haxelib newrepo
# Install hscript at latest git hash as of 07/11/2020
haxelib install haxelib.json
# Run the Main script to
haxe build.hxml
```

There was a case where a similar issue seemed to have occured even in simpler operations, but it has not been reproducible yet and may need further investigation. One such example:

```haxe
var dx = pointx - getX();
var dy = pointy - getY();
if (((dx * dx) + (dy * dy)) < (RADIUS * RADIUS)) {
  // This condition would pass when it should not have
}
```