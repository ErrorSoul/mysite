class MainPagesController < ApplicationController

  Page::NAMES.each do |name|
    define_method name do
      @page = Page.find_by(name: name)
      @main = true if name == "main"
      render :show
    end

  end
end
