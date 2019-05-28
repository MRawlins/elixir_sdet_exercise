defmodule FacebookPage do
  use Hound.Helpers
  def goToFacebook do
    navigate_to "https://www.facebook.com/"
  end

  def clickSignupButton do
    signupButton = find_element(:id, "u_0_u")
    click(signupButton)
  end

  def isSignuupButtonVisible do
    signupButton = find_element(:id, "u_0_u")
    element_displayed?(signupButton)
  end

  def fillField(element, fieldValue) do
    click(element)
    send_text(fieldValue)
  end
end
