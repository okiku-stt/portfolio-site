class TopController < ApplicationController
  def index
    @now = Time.current.strftime('%Y年%-m月%-d日(%a)')
  end
end
