module BlogHelper
  # 한 곳이 아니라 다양한 곳에서 같은 action을 사용한다면 깔끔하게 작성하기 위해 helper를 이용한다.

  # :user_id라는 session의 key에 user.id를 저장.
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end

  def destroy(user)
    destroyId = User.find_by(id: user.id)
    destroyId.destroy
    redirect_to :root
  end

  # 현재 쿠키에 존재하는 user를 찾는 action
  def current_user
    # 매번 db에서 find하기엔 비효율적.
    # User.find_by(id: session[:user_id])

    # 인스턴스 변수 @, ||= 좌측이 nil일때 우측 명령 실행
    @currnet_user ||= User.find_by(id: session[:user_id])
  end

  # 현재 로그인이 되어 있습니까?
  def user_signed_in?
    !current_user.nil?
  end
end
