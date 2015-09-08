class DashboardController < ApplicationController
  def show
    @features = Feature.all
  end
end
