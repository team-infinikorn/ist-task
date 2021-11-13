# frozen_string_literal: true

#
# Base Interactor
#
class ApplicationInteractor
  include Interactor

  private

  def error(errors)
    context.fail!(errors: errors)
  end
end
