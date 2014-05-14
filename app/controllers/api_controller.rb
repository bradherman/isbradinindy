# -*- encoding : utf-8 -*-
class ApiController < ApplicationController
  before_filter :authenticate
  
  private

  def authenticate
    if Rails.env.production?
      if !!ApiKey.exists?(access_token: params[:access_token])
        return true
      else
        authenticate_or_request_with_http_token do |token, options|
          !!ApiKey.exists?(access_token: token)
        end
      end
    end
  end
end
