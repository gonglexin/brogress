class PagesController < ApplicationController
  skip_before_action :require_login

  def index
  end

  def about
  end

  def help
  end
end
