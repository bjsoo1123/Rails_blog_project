class BlogController < ApplicationController

  def index
  end


  def login

    # find_by로 하게 되면 값이 없더라고 error가 발생하지 않고 nil값이 return됨.
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      # session[:user_id] = user.id
      log_in(user)

      # action까지 불러와 화면을 다시 띄워주는 redirect_to
      redirect_to :root
    else
      flash.now[:alert] = "이메일 또는 패스워드가 일치하지 않습니다."

      # 화면만 다시 불러오는 render
      render 'index'
    end
  end


  # action을 html로 설정했을 경우 그 page로 넘어가게 되고 그렇지 않을 경우는 실행만.
  def sign_up
  end


  def create_user
    User.create(nickname: params[:nickname],
                email:params[:email], password:params[:password], password_confirmation: params[:password_confirmation])
    current_user
    flash[:alert]="회원가입이 완료되었습니다."
    redirect_to :root
  end


  def logout
    log_out
    redirect_to :root
  end


  def update
  end


  def edit
    if params[:password] === params[:password_confirmation]
      a = User.find_by(id: session[:user_id])
      a.nickname = params[:nickname]
      a.email = params[:email]
      a.password = params[:password]
      a.password_confirmation = params[:password_confirmation]
      a.save
      redirect_to :root
    else
      flash.now[:alert]="패스워드가 동일하지 않습니다."
      render 'update'
    end
  end


  def destroy
    a = User.find_by(id: session[:user_id])
    a.destroy
    redirect_to :root
  end

end
