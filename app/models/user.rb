class User < ApplicationRecord

  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.find_for_oauth(auth)
    # combination of uid and provider is only one,if dosen't exit, make new user.
    user = User.where(uid: auth.uid, provider: auth.provider).first

    if !user
      user = User.create(
          uid: auth.uid,
          provider: auth.provider,
          nickname: auth.info.nickname,
          email: User.dummy_email(auth),
          password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end

end

