module ProductHelper
  def truncate?
    'truncate' if action_name != 'show'
  end

  def format_decimal(number)
    format("%.2f", number)
  end
end
