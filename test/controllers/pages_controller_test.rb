require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get frontpage" do
    get pages_frontpage_url
    assert_response :success
  end

  test "should get delivery" do
    get pages_delivery_url
    assert_response :success
  end

  test "should get payment" do
    get pages_payment_url
    assert_response :success
  end

  test "should get contacts" do
    get pages_contacts_url
    assert_response :success
  end

end
