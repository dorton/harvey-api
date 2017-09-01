class ApiController < ApplicationController
    before_action do
      request.format = :json
    end
end
