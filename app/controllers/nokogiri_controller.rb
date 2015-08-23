require 'open-uri'

class NokogiriController < ApplicationController
  def index
    news_tmp_file = open('http://monterail.com/team')
    doc = Nokogiri::HTML(news_tmp_file)
    @results = doc.css(".description h2")
  end
end
