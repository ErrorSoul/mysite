# -*- coding: utf-8 -*-
module ApplicationHelper
  include Shared::BootstrapHelper

  def active_css(resource)
    'active' if current_page?(admin_fund_path(resource))
  end

  def active_page_css(resource)
    'active'  if current_page?(admin_fund_nested_pages_path(resource))
  end

  def active_period_css(resource)
    'active' if current_page?(admin_fund_nested_periods_path(resource))
  end

  def active_piece_css(resource)
    'active' if current_page?(admin_fund_nested_pieces_path(resource))
  end

  def active_flag_css(flag)
    'active' if flag
  end

  def active_pages_helper(resource, flag)
    active_page_css(resource) || active_flag_css(flag)
  end

  def active_periods_helper(resource, flag)
    active_period_css(resource) || active_flag_css(flag)
  end

  def active_pieces_helper(resource, flag)
    active_piece_css(resource) || active_flag_css(flag)
 end

  def file_type(name)
    type = name.split('.').last
    type == 'xlsx' ? 'xls' : type
  end

  def active?(ind)
    ind.zero? ? 'active' : ''
  end

  def releases_helper(resource)
    if current_page?(releases_path) || current_page?(release_path(resource))
      'active'
    end
  end

  def smis_helper(resource)
    if current_page?(smis_path) || current_page?(smi_path(resource))
      'active'
    end
  end

  def press_path_helper(post)
    if post.object_type == 'release'
      releases_path
    else
      smis_path
    end
  end

  def weekend?(date)
    date.sunday? || date.saturday?
  end

  def next_after_weekend(date)
    date +=  1.day
    if !weekend?(date)
      date
    else
      next_after_weekend(date + 1.day)
    end
  end

  def docs_selected(page)
    files = page.assets
    buh_info = files.select { |m| m if m.name.mb_chars.downcase.include?('ухгал'.mb_chars.downcase) }
    open_info = files.select { |m| m  if m.name.mb_chars.downcase.include?('собственных'.mb_chars.downcase) }
    others = files - (buh_info + open_info)
    [buh_info, open_info, others]
  end
end
