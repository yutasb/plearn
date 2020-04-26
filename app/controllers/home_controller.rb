# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :login_required
  def top
    render layout: false
    # application.html.erbを適用しない
  end
end
