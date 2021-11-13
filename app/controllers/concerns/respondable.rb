module Respondable
  extend ActiveSupport::Concern

  def render_not_found
    render status: :not_found, json: { errors: { base: I18n.t('activerecord.errors.messages.not_found') } }
  end

  def render_no_content
    render status: :no_content, json: {}
  end

  def render_okay(json_content = {})
    render status: :ok, json: json_content
  end

  def render_created(json_content = {})
    render status: :created, json: json_content
  end

  def render_unauthorized
    render status: :unauthorized, json: {}
  end

  def render_unprocessable_entity(errors: [])
    render status: :unprocessable_entity, json: errors
  end
end
