require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { first_name: @contact.first_name, last_name: @contact.last_name, participant_id: @contact.participant_id, phone_1: @contact.phone_1, phone_1_type: @contact.phone_1_type, phone_2: @contact.phone_2, phone_2_type: @contact.phone_2_type, relation: @contact.relation }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    put :update, id: @contact, contact: { first_name: @contact.first_name, last_name: @contact.last_name, participant_id: @contact.participant_id, phone_1: @contact.phone_1, phone_1_type: @contact.phone_1_type, phone_2: @contact.phone_2, phone_2_type: @contact.phone_2_type, relation: @contact.relation }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
