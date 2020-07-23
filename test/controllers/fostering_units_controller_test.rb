require 'test_helper'

class FosteringUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fostering_unit = fostering_units(:one)
  end

  test "should get index" do
    get fostering_units_url, as: :json
    assert_response :success
  end

  test "should create fostering_unit" do
    assert_difference('FosteringUnit.count') do
      post fostering_units_url, params: { fostering_unit: { date: @fostering_unit.date, price: @fostering_unit.price } }, as: :json
    end

    assert_response 201
  end

  test "should show fostering_unit" do
    get fostering_unit_url(@fostering_unit), as: :json
    assert_response :success
  end

  test "should update fostering_unit" do
    patch fostering_unit_url(@fostering_unit), params: { fostering_unit: { date: @fostering_unit.date, price: @fostering_unit.price } }, as: :json
    assert_response 200
  end

  test "should destroy fostering_unit" do
    assert_difference('FosteringUnit.count', -1) do
      delete fostering_unit_url(@fostering_unit), as: :json
    end

    assert_response 204
  end
end
