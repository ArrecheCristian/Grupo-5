require 'test_helper'

class ViviendaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vivienda_index_url
    assert_response :success
  end

  test "should get show" do
    get vivienda_show_url
    assert_response :success
  end

  test "should get new" do
    get vivienda_new_url
    assert_response :success
  end

  test "should get edit" do
    get vivienda_edit_url
    assert_response :success
  end

  test "should get update" do
    get vivienda_update_url
    assert_response :success
  end

  test "should get destroy" do
    get vivienda_destroy_url
    assert_response :success
  end

end
