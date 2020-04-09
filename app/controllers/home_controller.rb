# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    render layout: false
    # application.html.erbを適用しない
  end
end
