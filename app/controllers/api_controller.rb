class ApiController < ApplicationController
  skip_before_action :doorkeeper_authorize!
end
