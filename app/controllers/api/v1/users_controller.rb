class Api::V1::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_api, except: :logout

	def login
		user = User.find_by_email(params[:email])
		if user and user.valid_password?(params[:password])
			sign_in(:user, user)
			render json: { message: "successfully Logged in." }, status: 201
		else
			render json: { errors: "Invalid user and password." }, status: 422
		end
	end

	def register
		user = User.new(email: params[:email], password: params[:password], confirm_password: params[:confirm_password])
		if user.save
			render json: { message: "Registration successful." }, status: 201
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def logout
		user = User.find_by_email(params[:email])
		if user
			sign_out(user)
			render json: { message: "successfully Logged out." }, status: 201
		else
			render json: { errors: "Invalid user." }, status: 422
		end
	end

	protected

	def authenticate_api
    render json: { errors: "Already logged in." }, status: 301 if current_user
  end
end