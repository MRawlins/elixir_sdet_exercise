defmodule ElixirSdetExerciseTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  # test "facebook signup button is visible" do
  #   try do
  #     FacebookPage.goToFacebook()
  #     signupButton = find_element(:id, "u_0_u")
  #     assert(element_displayed?(signupButton))
  #   rescue
  #     e in RuntimeError -> e
  #     take_screenshot("./screenshots/signupVisible.png")
  #     raise e
  #   end
  # end

#  test "clicking signup causes all fields to show errors" do
#    try do
#      FacebookPage.goToFacebook()
#      fields = initializeFields()

#      FacebookPage.clickSignupButton()
#      assert(not FacebookPage.checkForErrorInField(fields.firstNameField))
#      assert(FacebookPage.checkForErrorInField(fields.lastNameField))
#      assert(FacebookPage.checkForErrorInField(fields.contactField))
#      assert(FacebookPage.checkForErrorInField(fields.passwordField))
#      assert(FacebookPage.checkForErrorInField(fields.genderRadioWrapper))
#      assert(FacebookPage.isSignupButtonVisible)
#    rescue
#      e in RuntimeError -> e
#      take_screenshot("./screenshots/allFieldsErrors.png")
#      raise e
#    end
#  end

  test "first name field throws error when only one not filled in" do
    try do
      FacebookPage.goToFacebook()

      firstNameField = find_element(:id, "u_0_c")
      lastNameField = find_element(:id, "u_0_e")
      contactField = find_element(:id, "u_0_h")
      contactReenterField = find_element(:id, "u_0_k")
      passwordField = find_element(:id, "u_0_o")
      genderRadioWrapper = find_element(:id, "u_0_s")
      femaleRadioButton = find_element(:id, "u_0_9")
      maleRadioButton = find_element(:id, "u_0_a")

      FacebookPage.fillField(lastNameField, "Last")
      FacebookPage.fillField(contactField, "test@test.com")
      FacebookPage.fillField(passwordField, "Password1")
      click(maleRadioButton)

      FacebookPage.clickSignupButton()
      assert(firstNameField == element_in_focus()) #first name class _5dbc
      assert(not element?(:css, "#u_o_d i.sp_iIvgq58YJ3n")) #last name
      assert(not element?(:css, "#u_0_f i.sp_iIvgq58YJ3n")) #contact
      assert(not element?(:css, "#u_0_n i.sp_iIvgq58YJ3n")) #password
      assert(not element?(:css, "#u_0_r i.sp_iIvgq58YJ3n")) #radio
      assert(FacebookPage.isSignupButtonVisible)
     rescue
       e in RuntimeError -> e
       take_screenshot("./screenshots/firstNameError.png")
       raise e
     end
  end

#  test "last name field throws error when only one not filled in" do
#    try do
#      FacebookPage.goToFacebook()
#      fields = initializeFields()

  #     FacebookPage.fillField(fields.firstNameField, "First")
  #     FacebookPage.fillField(fields.contactField, "test@test.com")
  #     FacebookPage.fillField(fields.passwordField, "Password1")
  #     click(fields.maleRadioButton)

  #     FacebookPage.clickSignupButton()
  #     assert(not FacebookPage.checkForErrorInField(fields.firstNameField))
  #     assert(FacebookPage.checkForErrorInField(fields.lastNameField))
  #     assert(not FacebookPage.checkForErrorInField(fields.contactField))
  #     assert(not FacebookPage.checkForErrorInField(fields.passwordField))
  #     assert(not FacebookPage.checkForErrorInField(fields.genderRadioWrapper))
  #     assert(FacebookPage.isSignupButtonVisible)
  #   rescue
  #     e in RuntimeError -> e
  #     take_screenshot("./screenshots/lastNameError.png")
  #     raise e
  #   end
  # end

  # test "contact field throws error when only one not filled in" do
  #   try do
  #     FacebookPage.goToFacebook()
  #     fields = initializeFields()

  #     FacebookPage.fillField(fields.firstNameField, "First")
  #     FacebookPage.fillField(fields.lastNameField, "Last")
  #     FacebookPage.fillField(fields.passwordField, "Password1")
  #     click(fields.maleRadioButton)

  #     FacebookPage.clickSignupButton()
  #     assert(not FacebookPage.checkForErrorInField(fields.firstNameField))
  #     assert(not FacebookPage.checkForErrorInField(fields.lastNameField))
  #     assert(FacebookPage.checkForErrorInField(fields.contactField))
  #     assert(not FacebookPage.checkForErrorInField(fields.passwordField))
  #     assert(not FacebookPage.checkForErrorInField(fields.genderRadioWrapper))
  #     assert(FacebookPage.isSignupButtonVisible)
  #   rescue
  #     e in RuntimeError -> e
  #     take_screenshot("./screenshots/contactFieldError.png")
  #     raise e
  #   end
  # end

  # test "password field throws error when only one not filled in" do
  #   try do
  #     FacebookPage.goToFacebook()
  #     fields = initializeFields()

  #     FacebookPage.fillField(fields.firstNameField, "First")
  #     FacebookPage.fillField(fields.lastNameField, "Last")
  #     FacebookPage.fillField(fields.contactField, "test@test.com")
  #     click(fields.maleRadioButton)

  #     FacebookPage.clickSignupButton()
  #     assert(not FacebookPage.checkForErrorInField(fields.firstNameField))
  #     assert(not FacebookPage.checkForErrorInField(fields.lastNameField))
  #     assert(not FacebookPage.checkForErrorInField(fields.contactField))
  #     assert(FacebookPage.checkForErrorInField(fields.passwordField))
  #     assert(not FacebookPage.checkForErrorInField(fields.genderRadioWrapper))
  #     assert(FacebookPage.isSignupButtonVisible)
  #   rescue
  #     e in RuntimeError -> e
  #     take_screenshot("./screenshots/passwordFieldError.png")
  #     raise e
  #   end
  # end

  # test "gender field throws error when only one not filled in" do
  #   try do
  #     FacebookPage.goToFacebook()
  #     fields = initializeFields()

  #     FacebookPage.fillField(fields.firstNameField, "First")
  #     FacebookPage.fillField(fields.lastNameField, "Last")
  #     FacebookPage.fillField(fields.contactField, "test@test.com")
  #     FacebookPage.fillField(fields.passwordField, "Password1")

  #     FacebookPage.clickSignupButton()
  #     assert(not FacebookPage.checkForErrorInField(fields.firstNameField))
  #     assert(not FacebookPage.checkForErrorInField(fields.lastNameField))
  #     assert(not FacebookPage.checkForErrorInField(fields.contactField))
  #     assert(not FacebookPage.checkForErrorInField(fields.passwordField))
  #     assert(FacebookPage.checkForErrorInField(fields.genderRadioWrapper))
  #     assert(FacebookPage.isSignupButtonVisible)
  #   rescue
  #     e in RuntimeError -> e
  #     take_screenshot("./screenshots/genderFieldError.png")
  #     raise e
  #   end
  # end
end
