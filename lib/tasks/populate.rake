# -*- coding: utf-8 -*-
namespace :db do
  desc 'uploads files from capeman.ru'
  task uploads: :environment do
    require 'open-uri'
    require 'nokogiri'
    base = 'tmp/'
    page = Page.find(17)
    source = 'http://capeman.ru/?page_id=401'
    pg = Nokogiri::HTML(open(source))

    pg = pg.css('.post ul')[0]

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

  desc 'populate new isu'
  task new_isu: :environment do
    %w(isu_a2 isu_a3).each do |name|
      Fund.create!(name: name, content: "")
    end
  end

  desc 'copy content for new isu'
  task copy_isu: :environment do
    isu = Fund.find_by(name: 'isu_ai')
    %w(isu_a2 isu_a3).map do |name|
      Fund.find_by(name: name)
    end.each do |fund|
      fund.info = isu.info
      fund.content = isu.content
      fund.condition = isu.condition
      fund.save!
    end
  end

  desc 'copy pages for new isu'
  task copy_pages: :environment do
    isu = Fund.find_by(name: 'isu_ai')
    funds = %w(isu_a2 isu_a3).map do |name|
      Fund.find_by(name: name)
    end
    funds.each do |fund|
      isu.pages.each do |page|
        fund.pages << page.make_copy
      end
    end
  end

  desc 'new isu with pages'
  task create_isu: :environment do
    RAKE::TASK["db:new_isu"].invoke
    RAKE::TASK["db:copy_isu"].invoke
    RAKE::TASK["db:copy_pages"].invoke
  end

  desc 'populate the pieces of funds with date and cost'
  task populate: :environment do
    workbook = RubyXL::Parser.parse('public/all.xlsx')

    sh = workbook[1]
    date = nil
    @fund = Fund.find(4)
    Piece.transaction do
      sh.each_with_index do |row, ind|
        # puts ind, "index"
        if ind >= 31 && row
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
	      if date.day == 28 and date.month != 2
	         date += 1.day
	      end
            end
          end
        end
      end
    end
  end
end
