# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = post_comments(:one)
  end

  test 'should create comment' do
    count_before = @post.post_comments.count

    post post_post_comments_url(@post), params: {
      post_comment: { body: 'new comment' }
    }

    assert_redirected_to post_url(@post)
    @post.reload
    count_after = @post.post_comments.count
    assert_equal count_before + 1, count_after
  end

  test 'should get edit' do
    get edit_post_post_comment_url(@post, @comment)
    assert_response :success
  end

  test 'should destroy comment' do
    count_before = @post.post_comments.count

    delete post_post_comment_url(@post, @comment)

    assert_redirected_to post_url(@post)
    @post.reload
    count_after = @post.post_comments.count
    assert_equal count_before - 1, count_after
  end

  test 'should update comment' do
    patch post_post_comment_url(@post, @comment), params: {
      post_comment: { body: 'Обновлённый текст' }
    }

    assert_redirected_to post_url(@post)
    @comment.reload
    assert_equal 'Обновлённый текст', @comment.body
  end

  test 'should not create invalid comment' do
    count_before = @post.post_comments.count

    post post_post_comments_url(@post), params: {
      post_comment: { body: '' }
    }

    assert_response :unprocessable_entity
    @post.reload
    assert_equal count_before, @post.post_comments.count
  end

  test 'should not update with invalid data' do
    patch post_post_comment_url(@post, @comment), params: {
      post_comment: { body: '' }
    }

    assert_response :unprocessable_entity
  end
end
