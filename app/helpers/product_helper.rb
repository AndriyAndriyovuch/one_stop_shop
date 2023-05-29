module ProductHelper
  def truncate?
    'truncate' if action_name != 'show'
  end
end
