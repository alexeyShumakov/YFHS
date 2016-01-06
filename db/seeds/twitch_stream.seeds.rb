%w(trumpsc hero_firebat kolento strifecro lifecoach1981 gaarabestshaman MaSsanSC Eligorko
  amazhs neirea thijsHS hsdogdog reynad27 savjz noxious_hs nl_kripp superjj102 Zetalot
  kucha044 silvername abver gnumme).each do |streamer_name|
  @stream = TwitchStream.new
  @streamer = Twitch.new.user streamer_name

  @stream.streamer_name = @streamer[:body]['display_name']
  @stream.avatar = @streamer[:body]['logo']
  @stream.online = false
  @stream.viewers = 0
  @stream.save
end
