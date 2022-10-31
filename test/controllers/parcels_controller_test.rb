require "test_helper"

class ParcelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parcel = parcels(:one)
  end

  test "should get index" do
    get parcels_url, as: :json
    assert_response :success
  end

  test "should create parcel" do
    assert_difference("Parcel.count") do
      post parcels_url, params: { parcel: { destination: @parcel.destination, from: @parcel.from, order_status: @parcel.order_status, recipient_address: @parcel.recipient_address, recipient_contact: @parcel.recipient_contact, recipient_name: @parcel.recipient_name, total_cost: @parcel.total_cost, weight: @parcel.weight } }, as: :json
    end

    assert_response :created
  end

  test "should show parcel" do
    get parcel_url(@parcel), as: :json
    assert_response :success
  end

  test "should update parcel" do
    patch parcel_url(@parcel), params: { parcel: { destination: @parcel.destination, from: @parcel.from, order_status: @parcel.order_status, recipient_address: @parcel.recipient_address, recipient_contact: @parcel.recipient_contact, recipient_name: @parcel.recipient_name, total_cost: @parcel.total_cost, weight: @parcel.weight } }, as: :json
    assert_response :success
  end

  test "should destroy parcel" do
    assert_difference("Parcel.count", -1) do
      delete parcel_url(@parcel), as: :json
    end

    assert_response :no_content
  end
end
