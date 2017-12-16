require 'discordrb'
require 'http'
require 'json'

titans = [11567, 671, 45649, 3764, 42241, 23773, 42126]
supers = [23919, 22852, 23913, 3514, 42125, 23917]

#Insert your Discord Bot token here

bot = Discordrb::Bot.new token: ''

loop do
	redisq = HTTP.get("https://redisq.zkillboard.com/listen.php?queueID=bitterexbot")
	parsed = JSON.parse(redisq, object_class: OpenStruct)
	if !parsed.package.nil?
		if supers.include?(parsed.package.killmail.victim.ship_type_id) || titans.include?(parsed.package.killmail.victim.ship_type_id)
			#Insert the channel_id where you want the message to be sent to here
      bot.send_message(channel_id, "Some retard died http://www.zkillboard.com/kill/"+parsed.package.killID.to_s+"/")
		end
	end
end

bot.run
