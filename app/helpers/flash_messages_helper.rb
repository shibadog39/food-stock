# frozen_string_literal: true

module FlashMessagesHelper
  def flash_class(level)
    case level.to_s
    when 'notice' then 'notification is-info'
    when 'warning' then 'notification is-warning'
    when 'error' then 'notification is-danger'
    end
  end
end
