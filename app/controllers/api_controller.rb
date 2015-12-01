class ApiController < ApplicationController
  include JSONAPI::ActsAsResourceController
  def context
    {
      current_user: current_user,
      params:       params
    }
  end
end
