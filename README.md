# Tetris Mars ![Build](https://github.com/thatosmk/tetris-mars/workflows/Build/badge.svg?branch=master)

Ruby implementation of [Google's Mars Rover challenge](https://code.google.com/archive/p/marsrovertechchallenge/).

## Assumptions

1. Turn instructions, e.g, L, R and M, are always capitalised.
2. The rover will not be instructed to move beyond the boundary points of the plateau. The movement over the boundaries
   of the plateau will not be executed.
3. The plateau can be as big as possible, but for the nature of the example, we will restrict its size to anything below
   100.

## Why I believe it works

> I ran tests on individual components, i.e. ```GPS, Plateau and Rover```.

Thus, this gave me more confidence to expect correct results when running ```main.rb``` and
testing it as a blackbox. While my assumptions hold, the rover should exhibit the expected
behaviour.

## Requirements

You must have **Ruby 2.5.1** or latest installed.

## Getting started 

Install the dependencies

```
  $ bundle install
```

Then run the script with any data in ```data``` directory.
```
  $ ruby main.rb data/data0.txt
```
or make it executable
```
  $ chmod +x main.rb
  $ ./main.rb data/data0.txt
```

## Testing

To run the unit tests, simply

```
  $ rspec --format documentation
```
