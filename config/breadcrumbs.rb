crumb :root do
  link t(:main), root_path
end

crumb :funds do
  link t(:funds), funds_path
  parent :root
end

crumb :fund do |fund|
  link t(fund.name), fund_path(fund)
  parent :funds
end

crumb :admin do
  link t(:main), admin_dashboard_path
end

crumb :admin_funds do 
  link t(:funds), admin_funds_path
  parent :admin
end

crumb :admin_fund do |fund|
  link t(fund.name), admin_fund_path(fund)
  parent :admin_funds
end

crumb :admin_pages do
  link t(:pages), admin_pages_path
  parent :admin
end

crumb :page do |page|
  link t(page.name), main_page_path(page)

  if page.fund
    parent page.fund
  elsif page.main_page
    parent page.main_page
  else
    parent :root
  end
end

crumb :admin_page do |page|
  link t(page.name), admin_page_path(page)

  if page.fund
    parent :funds_pages, page.fund
  elsif page.main_page
    parent :admin_page, page.main_page
  else
    parent :admin_pages
  end
end

crumb :funds_pages do |fund|
  link t(:funds_pages), admin_fund_path(fund)
  parent :admin_fund, fund
end

crumb :periods do  |fund|
  link t(:periods), admin_fund_nested_periods_path(fund)
  parent :admin_fund, fund
end

crumb :period_new do |fund|
  link t(:period_new), "#"
  parent :periods, fund
end

crumb :period do |fund, period|
  link period.name, admin_fund_nested_period_path(fund, period)
  parent :periods, fund
end

# fund :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
