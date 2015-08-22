require 'test_helper'

class TrelloCardsControllerTest < ActionController::TestCase
  setup do
    @trello_card = trello_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trello_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trello_card" do
    assert_difference('TrelloCard.count') do
      post :create, trello_card: { card_id: @trello_card.card_id, shortlink: @trello_card.shortlink }
    end

    assert_redirected_to trello_card_path(assigns(:trello_card))
  end

  test "should show trello_card" do
    get :show, id: @trello_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trello_card
    assert_response :success
  end

  test "should update trello_card" do
    patch :update, id: @trello_card, trello_card: { card_id: @trello_card.card_id, shortlink: @trello_card.shortlink }
    assert_redirected_to trello_card_path(assigns(:trello_card))
  end

  test "should destroy trello_card" do
    assert_difference('TrelloCard.count', -1) do
      delete :destroy, id: @trello_card
    end

    assert_redirected_to trello_cards_path
  end
end
