require "application_system_test_case"

class TasteTestersTest < ApplicationSystemTestCase
  setup do
    @taste_tester = taste_testers(:one)
  end

  test "visiting the index" do
    visit taste_testers_url
    assert_selector "h1", text: "Taste Testers"
  end

  test "creating a Taste tester" do
    visit taste_testers_url
    click_on "New Taste Tester"

    fill_in "Age", with: @taste_tester.age
    fill_in "Name", with: @taste_tester.name
    click_on "Create Taste tester"

    assert_text "Taste tester was successfully created"
    click_on "Back"
  end

  test "updating a Taste tester" do
    visit taste_testers_url
    click_on "Edit", match: :first

    fill_in "Age", with: @taste_tester.age
    fill_in "Name", with: @taste_tester.name
    click_on "Update Taste tester"

    assert_text "Taste tester was successfully updated"
    click_on "Back"
  end

  test "destroying a Taste tester" do
    visit taste_testers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taste tester was successfully destroyed"
  end
end
