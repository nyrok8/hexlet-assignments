# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should show all bulletins' do
    get bulletins_path

    assert_response :success
    assert_select 'h1', 'Bulletins'
    assert_select 'h3', 'Title 1'
    assert_select 'h3', 'Title 2'
  end

  test 'should show bulletin' do
    get bulletin_path(bulletins(:one))

    assert_response :success
    assert_select 'h2', 'Title 1'
    assert_select 'p', 'Body 1'
    assert_select 'p', 'true'
  end
end
