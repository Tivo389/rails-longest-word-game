require 'open-uri'
require 'json'
require_relative '../../lib/game.rb'

class WordsController < ApplicationController
  def createGrid
    game = Game.new
    @grid = game.generate_grid(12)
  end

  def scoreGrid
    @input = params[:query]
    @time_start = params[:time_start]
    @pass_grid = JSON.parse(params[:grid])
    # raise
    # Although the param is an array in the inspector, it becomes a string with backslashes once its in the controller...WHY? CONTINUE HERE .... JSON PARSE SEEMED TO WORK!!!
    @end_time = Time.now().to_i
    game = Game.new
    @result = game.run_game(@input, @pass_grid, @time_start, @end_time)
  end
end
