require 'test_helper'

class TasteTestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taste_tester = taste_testers(:one)
  end

  test "should get index" do
    get taste_testers_url
    assert_response :success
  end

  test "should get new" do
    get new_taste_tester_url
    assert_response :success
  end

  test "should create taste_tester" do
    assert_difference('TasteTester.count') do
      post taste_testers_url, params: { taste_tester: { age: @taste_tester.age, name: @taste_tester.name } }
    end

    assert_redirected_to taste_tester_url(TasteTester.last)
  end

  test "should show taste_tester" do
    get taste_tester_url(@taste_tester)
    assert_response :success
  end

  test "should get edit" do
    get edit_taste_tester_url(@taste_tester)
    assert_response :success
  end

  test "should update taste_tester" do
    patch taste_tester_url(@taste_tester), params: { taste_tester: { age: @taste_tester.age, name: @taste_tester.name } }
    assert_redirected_to taste_tester_url(@taste_tester)
  end

  test "should destroy taste_tester" do
    assert_difference('TasteTester.count', -1) do
      delete taste_tester_url(@taste_tester)
    end

    assert_redirected_to taste_testers_url
  end
end
