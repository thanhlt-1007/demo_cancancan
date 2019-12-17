module ApplicationHelper
  def flash_class type
    case type
    when "notice"
      "alert-success"
    when "alert"
      "alert-danger"
    else
      "alert-#{type}"
    end
  end
end
