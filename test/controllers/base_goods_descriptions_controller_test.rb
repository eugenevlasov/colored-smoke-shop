require 'test_helper'

class BaseGoodsDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_goods_description = base_goods_descriptions(:one)
  end

  test "should get index" do
    get base_goods_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_base_goods_description_url
    assert_response :success
  end

  test "should create base_goods_description" do
    assert_difference('BaseGoodsDescription.count') do
      post base_goods_descriptions_url, params: { base_goods_description: { base: @base_goods_description.base, burning_time: @base_goods_description.burning_time, country: @base_goods_description.country, depth: @base_goods_description.depth, description: @base_goods_description.description, diameter: @base_goods_description.diameter, height: @base_goods_description.height, in_hand: @base_goods_description.in_hand, name: @base_goods_description.name } }
    end

    assert_redirected_to base_goods_description_url(BaseGoodsDescription.last)
  end

  test "should show base_goods_description" do
    get base_goods_description_url(@base_goods_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_base_goods_description_url(@base_goods_description)
    assert_response :success
  end

  test "should update base_goods_description" do
    patch base_goods_description_url(@base_goods_description), params: { base_goods_description: { base: @base_goods_description.base, burning_time: @base_goods_description.burning_time, country: @base_goods_description.country, depth: @base_goods_description.depth, description: @base_goods_description.description, diameter: @base_goods_description.diameter, height: @base_goods_description.height, in_hand: @base_goods_description.in_hand, name: @base_goods_description.name } }
    assert_redirected_to base_goods_description_url(@base_goods_description)
  end

  test "should destroy base_goods_description" do
    assert_difference('BaseGoodsDescription.count', -1) do
      delete base_goods_description_url(@base_goods_description)
    end

    assert_redirected_to base_goods_descriptions_url
  end
end
