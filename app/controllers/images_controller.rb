  class ImagesController < ApplicationController
    before_action :current_user, only: [:index, :show]


  end
