namespace :db do
  desc "populate the pieces of funds with date and cost"
  task populate: :environment do
    workbook = RubyXL::Parser.parse("site/all.xlsx")

    sh = workbook[5]
    date = nil
    @fund = Fund.find(2)
    Piece.transaction do 
      sh.each_with_index do |row, ind|
        #puts ind, "index"
        if ind >= 40 && row
          if row.cells[1] && row.cells[1].value
            date ||= row.cells[0].value
            if date == row.cells[0].value
              @fund.pieces.create!(
                observ_date: row.cells[0].value,
                cost: row.cells[2].value,
                pure_cost: row.cells[1].value
               )
              puts "#{row.cells[0].value.to_s}  #{row.cells[1].value} #{row.cells[2].value}"
              date += 1.months
            end
          end
        end
      end
    end

  end
end
