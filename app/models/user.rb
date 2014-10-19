class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,  
         :recoverable, :rememberable, :trackable, :validatable
  #before_save :ensure_authentication_token
  #attr_accessible :email, :password, :uid, :provider
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create( name:     auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          password: Devise.friendly_token[0, 20]
                        )
    end
    return user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create( name:     auth.info.nickname,
                          provider: auth.provider,
                          uid:      auth.uid,
			  email:    User.create_quiz_psuedo_email(auth.info.nickname), 
                          password: Devise.friendly_token[0, 20]
                          )
    end
    return user
  end

  # To create psuedo email for twitter login user.
  def self.create_quiz_psuedo_email(twitter_nickname)
    "twitter." + twitter_nickname + "@quiz-psuedo-account.socioquiz"
  end

  has_many :quizzes
end
