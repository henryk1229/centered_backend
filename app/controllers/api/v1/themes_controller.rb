class Api::V1::ThemesController < ApplicationController

  def index
    themes = Theme.all

    render json: themes
  end

  def show
    theme = Theme.find(theme_params)

    render json: theme
  end

  private
  
  def theme_params
    params.permit(:name)
  end

end
