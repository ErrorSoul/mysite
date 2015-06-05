# == Schema Information
#
# Table name: quartals
#
#  id         :integer          not null, primary key
#  first_q    :string(255)
#  second_q   :string(255)
#  third_q    :string(255)
#  fourth_q   :string(255)
#  period_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  obj_type   :string(255)
#  first_d    :date
#  second_d   :date
#  third_d    :date
#  fourth_d   :date
#

class Quartal < ActiveRecord::Base
  TYPES = %w(
    balance
    owners
    growth
    change
    note
    ref_require
    ref_price
    ref_pure
  ).freeze

  ATTRS = %i(first_q second_q third_q fourth_q).freeze

  NUMS  = %i(first second third fourth)

  ATTRS.each do |attr|
    mount_uploader attr, AttachUploader
  end

  belongs_to :period

  ATTRS.each  do |met|

    define_method "#{met}_ext" do
      send("#{met}").file.extension if send("#{met}").file
    end

    define_method "#{met}_file_url" do
      if send("#{met}_ext").in? %w(xls xlsx)
        "files/xls_a.png"
      else
       nil
      end
    end
  end

end
