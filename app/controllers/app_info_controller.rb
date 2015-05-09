class AppInfoController < ApplicationController

  def version
    @version = { version: "0.0.1" }

    render json: @version
  end

end
