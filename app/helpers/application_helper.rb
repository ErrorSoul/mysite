module ApplicationHelper

  include Shared::BootstrapHelper

  def active_css(resource)
    "active" if current_page?(admin_fund_path(resource))
  end

  def active_page_css(resource)
   "active"  if current_page?(admin_fund_nested_pages_path(resource))
  end

  def active_period_css(resource)
    "active" if current_page?(admin_fund_nested_periods_path(resource))
  end

  def active_flag_css(flag)
    "active" if flag
  end

  def active_pages_helper(resource, flag)
    active_page_css(resource) || active_flag_css(flag)
  end

  def active_periods_helper(resource, flag)
    active_period_css(resource) || active_flag_css(flag)
  end

end
