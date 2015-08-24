require 'open-uri'

class NokogiriController < ApplicationController
  def index
    positions = open('http://monterail.com/team')
    doc = Nokogiri::HTML(positions)
    openings = open('http://join.hussa.rs')
    doc2 =  Nokogiri::HTML(openings)


    @employees = doc.css(".one-person .description p")
    @openings = doc2.css(".grid__item:contains('Wrocław') strong")

    @juniors = @employees.text.scan(/Junior Ruby/)
    @counts = @juniors.count


    # @text2 = doc.css(".one-person .description h2").scan(/\w+/).length
    # @text = doc.css(".one-person").inner_text
    # @text_size = doc.css(".one-person").inner_text.scan(/\w+/).length
  end
end