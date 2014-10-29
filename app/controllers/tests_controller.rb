class TestsController < ApplicationController

  def index

    render json:'{ "hello" : "world" }'

  end

end
