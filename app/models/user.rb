class User < ActiveRecord::Base
  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      name: params['info']['name'],
      password: Devise.friendly_token,
      confirmation_token: nil,
      confirmed_at: Time.now.utc
    }

    create(attributes)
  end

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
