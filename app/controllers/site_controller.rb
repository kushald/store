class SiteController < ApplicationController
  require 'rubygems' 
  require 'nokogiri'
  require 'open-uri'
  def about_us
  end
  
  def contact_us
    
  end
  
  def blog
    @feeds = {}
    @rss = Nokogiri::XML(open("http://fudehouse.com/rss"))
    5.times do |i|
      @feeds[i]= {:title => @rss.xpath("//item/title")[i].text, :description => @rss.xpath("//item/description")[i].text}
    end
  end
end
