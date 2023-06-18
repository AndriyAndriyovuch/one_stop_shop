module UserHelper
  def button_text(action)
    puts action
    action == "new" ? "Sign up" : "Update account"
  end
end
