require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Motivate
    @values = nil

    def initialize
        @values = JSON.parse(File.read('./lib/frases.txt'))
        
    end
    
    
    def select_random

        @values = @values.sample
        @values
    end
    
end