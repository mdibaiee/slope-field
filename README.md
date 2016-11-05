slope-field
===========

I was studying [this course on Integration](https://www.edx.org/course/calculus-1b-integration-mitx-18-01-2x) when I encountered
slope fields and I found them interesting!

So I thought I would give it a shot and try to write a program to draw slope fields myself!
In order to read a mathematical function definition from input, I wrote [mathexpr](/mdibaiee/mathexpr).

Get Started
-----------
If you haven't already, install [Haskell Platform](https://www.haskell.org/platform/).

```
git clone https://github.com/mdibaiee/slope-field
cd slope-field
stack install
slope-field
```
Examples
--------
Parameters:
  - dy/dx: derivative of the function you are trying to visualize
  - range: range of numbers to draw
  - estimation size: size of `deltax` which is used to draw the slope corresponding to a small point, `0.03` is usually a good number, but you might want to try out larger numbers to get a more detailed picture on some examples
```
dy/dx = 
x + y
range - format: (lower, upper): 
(-10, 10)
estimation size: 
0.03
```

![x plus y](https://github.com/mdibaiee/slope-field/blob/master/xpy.png?raw=true)

```
dy/dx = 
x * y
range - format: (lower, upper): 
(-10, 10)
estimation size: 
0.03
```

![x times y](https://github.com/mdibaiee/slope-field/blob/master/xty.png?raw=true)

```
dy/dx = 
-y
range - format: (lower, upper): 
(-10, 10)
estimation size: 
0.03
```

![minus y](https://github.com/mdibaiee/slope-field/blob/master/minusy.png?raw=true)

```
dy/dx = 
y/x
range - format: (lower, upper): 
(-10, 10)
estimation size: 
0.1
```

![y divided by x](https://github.com/mdibaiee/slope-field/blob/master/ydx.png?raw=true)
