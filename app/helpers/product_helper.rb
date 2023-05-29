module ProductHelper
  def description_class(action)
    action == 'show' ? 'my-5' : 'my-5 truncate'
  end
end
