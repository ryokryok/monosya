module ApplicationHelper
  def email_auth?
    return current_user.provider.blank?
  end
end
