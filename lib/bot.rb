require 'telegram/bot'
require_relative 'motivate.rb'

class Bot
    def initialize
        token = '930897758:AAFcce3GwyeOEwS7smiZYDlZUUXQgI9C1dk'
    Telegram::Bot::Client.run(token) do |bot|
        bot.listen do |message|
            case message.text
            when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Olá, #{message.from.first_name} , bem vindo ao meu primeiro bot criado em Ruby. Use  /start para iniciar o bot,  /stop para parar, 
                     ou /motivate para uma frase motivacional")
            when '/stop'
                bot.api.send_message(chat_id: message.chat.id, text: "Tchau, #{message.from.first_name}", date: message.date)
            when '/motivate'
                values = Motivate.new
                value = values.select_random 
                bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)
            else
                bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , /motivate")
            end
        end
    end
    end    
end
