# Tetris Mars ![Build](https://github.com/thatosmk/tetris-mars/workflows/Build/badge.svg?branch=master)

Ruby implementation of Google's Mars Rover challenge.

## Assumptions

1. Turn instructions, e.g, L or R, are always capitalised.
2. The rover will not be instructed to move beyond the boundary points of the plateau. The movement over the boundaries
   of the plateau will not be executed
3. The coordinates for the upper-right corner will never be bigger than (20, 20).

## Requirements

You must have **Ruby 2.5.1** or latest installed.

## Getting started 

Install the dependencies

```
  $ bundle install
```

Then run the script with any data in ```data``` directory. For example,
```
  $ ruby main.rb data/data0.txt
```

### Testing

To run the unit tests, simply

```
  $ ruby tests/*
```
