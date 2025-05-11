# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
    assert_selector 'a', text: 'New Post'
  end

  test 'should create Post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Title', with: 'Test Title'
    fill_in 'Body', with: 'Test body content'
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    assert_text 'Test Title'
    assert_text 'Test body content'
  end

  test 'should not create Post with empty title' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Some body text'
    click_on 'Create Post'

    assert_text "Title can't be blank"
  end

  test 'should update Post' do
    visit posts_url
    click_on 'Edit', match: :first

    fill_in 'Title', with: 'Updated Title'
    fill_in 'Body', with: 'Updated body content'
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    assert_text 'Updated Title'
    assert_text 'Updated body content'
  end

  test 'should destroy Post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
    assert_no_text 'Two'
  end
end
# END
