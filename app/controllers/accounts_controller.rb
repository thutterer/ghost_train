class AccountsController < ApplicationController
  def show
    authorize :application, :account?
  end

  def update
    head :ok # TODO
  end

  private

  def user_params
    params.require(:user).permit(:first_name, last_name)
  end
end
