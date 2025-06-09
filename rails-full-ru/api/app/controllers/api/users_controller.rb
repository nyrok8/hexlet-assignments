# frozen_string_literal: true

class Api::UsersController < Api::ApplicationController
  # BEGIN
  def index
    users = User.order(id: :desc)
    respond_with users.as_json(except: %i[password_digest created_at updated_at])
  end

  def show
    user = User.find(params[:id])
    respond_with user.as_json(except: %i[password_digest created_at updated_at])
  end
  # END
end
