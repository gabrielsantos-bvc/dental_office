require "test_helper"

class OfficesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office = offices(:one)
  end

  test "should get index" do
    get offices_url, as: :json
    assert_response :success
  end

  test "should create office" do
    assert_difference("Office.count") do
      post offices_url, params: { office: { address: @office.address, description: @office.description, name: @office.name } }, as: :json
    end

    assert_response :created
  end

  test "should show office" do
    get office_url(@office), as: :json
    assert_response :success
  end

  test "should update office" do
    patch office_url(@office), params: { office: { address: @office.address, description: @office.description, name: @office.name } }, as: :json
    assert_response :success
  end

  test "should destroy office" do
    assert_difference("Office.count", -1) do
      delete office_url(@office), as: :json
    end

    assert_response :no_content
  end
end
