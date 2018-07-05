require 'rest-client'
require 'json'
require 'nokogiri'


bestsong_title = Array.new
bestsong_singer = Array.new
bestsong = {}
melon_html = RestClient.get("https://www.melon.com/chart/index.htm")
melon_doc = Nokogiri::HTML(melon_html)

melon_doc.css("#lst50 > td:nth-child(6) > div > div").each_with_index do |song, index|
    title = song.css("div.ellipsis.rank01 span a").text
    if song.css("div.ellipsis.rank02 span a").length == 2
        singer = song.css("div.ellipsis.rank02 span a")[0].text + ", " + singer = song.css("div.ellipsis.rank02 span a")[1].text
    else
        singer = song.css("div.ellipsis.rank02 span a").text
    end
    bestsong[index] = {title: title, singer: singer}
end

num = (0..49).to_a.sample
#puts bestsong[num][:title]


 song_msg = bestsong[num][:title] + " - " + bestsong[num][:singer]
 msg = "안녕"

  token = ENV["telegram_token"]
  tele_url = RestClient.get("https://api.telegram.org/bot#{token}/getUpdates")
  tele_json = JSON.parse(tele_url)
  user_id = tele_json["result"][0]["message"]["from"]["id"]
  msg_url = URI.encode("https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{user_id}&text=#{song_msg}")
  RestClient.get(msg_url)




