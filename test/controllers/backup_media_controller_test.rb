require 'test_helper'

class BackupMediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backup_medium = backup_media(:one)
  end

  test "should get index" do
    get backup_media_url
    assert_response :success
  end

  test "should get new" do
    get new_backup_medium_url
    assert_response :success
  end

  test "should create backup_medium" do
    assert_difference('BackupMedium.count') do
      post backup_media_url, params: { backup_medium: { name: @backup_medium.name } }
    end

    assert_redirected_to backup_medium_url(BackupMedium.last)
  end

  test "should show backup_medium" do
    get backup_medium_url(@backup_medium)
    assert_response :success
  end

  test "should get edit" do
    get edit_backup_medium_url(@backup_medium)
    assert_response :success
  end

  test "should update backup_medium" do
    patch backup_medium_url(@backup_medium), params: { backup_medium: { name: @backup_medium.name } }
    assert_redirected_to backup_medium_url(@backup_medium)
  end

  test "should destroy backup_medium" do
    assert_difference('BackupMedium.count', -1) do
      delete backup_medium_url(@backup_medium)
    end

    assert_redirected_to backup_media_url
  end
end
