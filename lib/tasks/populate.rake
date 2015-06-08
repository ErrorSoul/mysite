# -*- coding: utf-8 -*-
namespace :db do
  desc 'uploads files from capeman.ru'
  task uploads: :environment do
    require 'open-uri'
    require 'nokogiri'
    base = 'tmp/'
    page = Page.find(32)
    source = 'http://capeman.ru/?page_id=115'
    pg = Nokogiri::HTML(open(source))

    pg = pg.css('.post ol')[1]

    pg.css('li a').each do |link|
      puts "LINK CONTENT =>  #{link['href']}"
      puts "BASE + LINK  =>  #{ base + link.content}"
      filename = link['href'].split('/').last
      puts "FILENAME => #{filename}"
      File.open(base + filename, "wb") do |file|
        encoded_url = URI.encode link['href']
        asset = page.assets.build

        file.write open(URI.parse(encoded_url), "rb").read
        asset.asset = file
        asset.name = link.content
        string_date = link.content.split('(').last.split(')').first
        begin
          asset.publicated_at  =  DateTime.strptime(string_date, 'Опубликовано %d.%m.%Yг., %H:%M')
        rescue ArgumentError => error
          asset.publicated_at = DateTime.now
        end

        asset.save!
      end
    end
  end

  desc 'populate the pieces of funds with date and cost'
  task populate: :environment do
    workbook = RubyXL::Parser.parse('site/all.xlsx')

    sh = workbook[5]
    date = nil
    @fund = Fund.find(2)
    Piece.transaction do
      sh.each_with_index do |row, ind|
        # puts ind, "index"
        if ind >= 40 && row
          if row.cells[1] && row.cells[1].value
            date ||= row.cells[0].value
            if date == row.cells[0].value
              @fund.pieces.create!(
                observ_date: row.cells[0].value,
                cost: row.cells[2].value,
                pure_cost: row.cells[1].value
               )
              puts "#{row.cells[0].value}  #{row.cells[1].value} #{row.cells[2].value}"
              date += 1.months
            end
          end
        end
      end
    end
  end
end
