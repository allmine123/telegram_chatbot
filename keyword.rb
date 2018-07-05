require 'telegram/bot'

token = ENV["telegram_token"]

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/manager'
      bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name}님 ㅎㅇㅌ")
    when '/music'
      bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name}님 에붸부베ㅞ베")
      
    end
  end
end