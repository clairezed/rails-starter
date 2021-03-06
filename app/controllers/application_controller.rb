# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_default_seos!, :get_basic_pages
  after_action :flash_to_headers, if: -> { request.xhr? && flash.present? }

  protected

  def get_seo_for_static_page(param)
    seo = Seo.where(param: param).first
    if seo
      @seo_title       = seo.title if seo.title.present?
      @seo_description = seo.description if seo.description.present?
      @seo_keywords    = seo.keywords if seo.keywords.present?
    end
  end

  rescue_from ActionController::InvalidAuthenticityToken do
    redirect_to root_path unless request.xhr?
  end

  private

  def set_default_seos!
    @seo_title       ||= 'Title du projet'
    @seo_description ||= 'Description du projet'
    @seo_keywords    ||= 'keywords du projet, projet'
  end

  # Pour les requêtes ajax
  def flash_to_headers
    %i[error alert warning notice].each do |type|
      next if flash[type].blank?
      content = { message: flash[type], type: ApplicationHelper::FLASH_BS_TYPES[type] }
      response.headers['X-Message'] = content.to_json
      flash.discard
      break
    end
  end

  def get_basic_pages
    @basic_pages = BasicPage.where(enabled: true).order(position: :asc)
  end
end
