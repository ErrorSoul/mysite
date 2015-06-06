# == Schema Information
#
# Table name: pieces
#
#  id          :integer          not null, primary key
#  observ_date :date
#  cost        :decimal(14, 3)
#  pure_cost   :decimal(14, 3)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  fund_id     :integer
#

class Piece < ActiveRecord::Base
  PERIODS = %i(
    month_1
    month_3
    month_6
    month_12
    found
  ).freeze

  belongs_to :fund
  scope :date_order, -> { order('observ_date ASC') }

  def date_month
    try(:observ_date).strftime('%m.%Y')
  end

  def before_last
    arr = fund.pieces.date_order
    if arr.size > 2
      arr[-2]
    else
      arr.last
    end
  end

  def three_ago
    arr = fund.pieces.date_order
    if arr.size >= 4
      arr[-4]
    else
      nil
    end
  end

  def six_ago
    arr = fund.pieces.date_order
    if arr.size >= 6
      arr[-6]
    else
      nil
    end
  end

  def change(before_last)
    k = before_last.cost > cost ? -1 : 1
    diff = before_last.cost / cost
    if diff == 1.0
      b = 0
    else
      b  = diff
    end
    k * b
  end

  def change_three(three_ago)
    if three_ago
      k = three_ago.cost > cost ? -1 : 1
      diff = three_ago.cost / cost
      if diff == 1.0
        b = 0
      else
        b  = diff
      end
      k * b
    else
      return '-'
    end
  end

  def change_six(six_ago)
    if six_ago
      k = six_ago.cost > cost ? -1 : 1
      diff = six_ago.cost / cost
      if diff == 1.0
        b = 0
      else
        b  = diff
     end
      k * b
    else
      return '-'
    end
 end
end
