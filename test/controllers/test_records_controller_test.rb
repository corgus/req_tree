require 'test_helper'

class TestRecordsControllerTest < ActionController::TestCase
  setup do
    @test_record = test_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_record" do
    assert_difference('TestRecord.count') do
      post :create, test_record: { server: @test_record.server, status: @test_record.status, timestamp: @test_record.timestamp }
    end

    assert_redirected_to test_record_path(assigns(:test_record))
  end

  test "should show test_record" do
    get :show, id: @test_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_record
    assert_response :success
  end

  test "should update test_record" do
    patch :update, id: @test_record, test_record: { server: @test_record.server, status: @test_record.status, timestamp: @test_record.timestamp }
    assert_redirected_to test_record_path(assigns(:test_record))
  end

  test "should destroy test_record" do
    assert_difference('TestRecord.count', -1) do
      delete :destroy, id: @test_record
    end

    assert_redirected_to test_records_path
  end
end
