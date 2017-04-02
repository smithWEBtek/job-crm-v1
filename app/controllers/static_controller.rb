class StaticController < ApplicationController
  def index
    render :welcome
  end

  def docs
    render :docs
  end
  def email
    render :email
  end

  def resources
    render :resources
  end

  def tools
    render :tools
  end
end
