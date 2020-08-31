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

### Accessing it locally

Install the dependencies

```
  $ bundle install
```

Then run the script with any data in ```data``` directory.
```
  $ ruby main.rb data/data0.txt

    1 3 N
    5 1 E
```
or make it executable
```
  $ chmod +x main.rb
  $ ./main.rb data/data0.txt

    1 3 N
    5 1 E
```

### Accessing it remotely [Creative extra]

* Using ```curl```

> Kindly allow a few minutes of delay for the Heroku app to boot up.
Make sure you have curl installed, then you run,
```
  $ curl -X POST -H "Content-Type: multipart/form-data;" --form "data_file=@data/data0.txt;type=application/text"  https://stark-forest-54278.herokuapp.com/

  Rover Final Positions:
  1 3 N
  5 1 E

```


## Visualisation of the conceptual model [Creative extra]

Run the script with any data in ```data``` directory using the ```--visualise``` command-line argument
```
  $ ruby main.rb data/data0.txt --visualise

    Initial Position Rover 1
    -----------
    ---------+-
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    Final Position
    ----------+
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    -----------
    10 10 N

```
> This feature is not available via remote access version

## Testing

To run the unit tests, simply

```
  $ rspec --format documentation
```
