class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:login]

  # POST /api/auth/login
  def login
    user = User.find_by(email: params[:email])

    unless user&.authenticate(params[:password])
      return render json: { error: 'Invalid email or password' }, status: :unauthorized
    end

    token = JsonWebToken.encode(user_id: user.id)

    render json: {
      token: token,
      user: {
        id: user.id,
        email: user.email,
        full_name: user.full_name,
        role: user.role.name
      }
    }
  end
  
  # GET /api/me
  def me
    render json: {
      id: current_user.id,
      email: current_user.email,
      full_name: current_user.full_name,
      role: current_user.role.name
    }
  end

end
