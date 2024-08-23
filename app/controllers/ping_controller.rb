# frozen_string_literal: true

class PingController < ApplicationController
  def show
    @ping_response = PingResponse.last
    if @ping_response
      render json: { response: @ping_response.text }
    else
      render json: { error: 'No PingResponse found' }, status: :not_found
    end
  end
end
