# plantuml

Docker Container for [PlantUML](http://plantuml.com).

Based on think/plantuml

## Usage

```
cat test.uml | docker run --rm -i ollpal/plantuml > test.svg
```

The default will output svg. If png output is wanted, call it like this:

```
cat test.uml | docker run --rm -i ollpal/plantuml -tpng > test.png
```
