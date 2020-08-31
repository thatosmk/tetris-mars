require 'rack'
require_relative 'rover'
require_relative 'plateau'

module TetrisMars
  class Controller
    attr_reader :results

    class InvalidParams < StandardError; end

    def self.greet
      "Hello form Mars rover exploration"
    end

    def initialize(params)
      @results = ""
      raise InvalidParams, "You need to provide a data file.\n" unless params["data_file"]
    end

    def run(file_data_array)
      if file_data_array
        xy = file_data_array[0].split(" ")
        grid = Plateau.new(xy[0].to_i,xy[1].to_i)

        no_rovers = (file_data_array.length - 1)
        i = 1

        while (i < no_rovers)
          position = file_data_array[i].split(" ")
          rover = Rover.new(position[0].to_i,position[1].to_i, position[2], grid)

          # TODO: visualise the rover in the plateau

          explore_instructions = file_data_array[i+1].chomp.split('')

          # start to move the first rover
          for instruction in explore_instructions do
            rover.drive(instruction)
          end

          # final position
          @results << rover.to_s
          @results << "\n"
          i+=2
        end
      else
        raise InvalidParams, "You need to provide a data file.\n"
      end
    end

    def to_s
      @results
    end
  end

  class API
    def call(env)
      request = Rack::Request.new(env)
      case request.request_method
      when 'GET'
        [200, {"Content-Type" => "text/plain"}, [TetrisMars::Controller.greet + "\n"]]
      when 'POST'
        begin
          params = Rack::Multipart.parse_multipart(env) 
          puts params
          file_info = params.values.find {|f| f.is_a? Hash and f.key? :tempfile }
          body = file_info[:tempfile].read
          file_info[:tempfile].close
          file_info[:tempfile].unlink
          puts "File contents are #{body.split("\n")}"

          exploration = TetrisMars::Controller.new(params)
          exploration.run(body.split("\n"))

        rescue TetrisMars::Controller::InvalidParams => error
          [400, {"Content-Type" => "text/plain"}, [error.message] ]
        else
          ['201', { 'Content-Type' => "text/plain" },["Rover Final Positions:\n" + exploration.to_s + "\n"]]
        end
      else
        [404, {}, ["Oops! Nothing here. Did you get lost?"]]
      end
    end
  end
end

map '/' do
  run TetrisMars::API.new
end
