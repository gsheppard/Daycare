module ApplicationHelper
  def iv_helper iv_bool
    if iv_bool
      %Q{iv_true}
    else
      %Q{iv_false}
    end
  end
end
