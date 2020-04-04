class ApiController < ActionController::Base
    protect_from_forgery :except => [:create, :update, :destroy]
end
