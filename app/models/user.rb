# == Schema Information
#
# Table name: users
#
#  id                                         :bigint           not null, primary key
#  allow_password_change                      :boolean          default(FALSE)
#  confirmation_sent_at                       :datetime
#  confirmation_token                         :string(255)
#  confirmed_at                               :datetime
#  email                                      :string(255)
#  encrypted_password                         :string(255)      default(""), not null
#  image                                      :string(255)
#  name                                       :string(255)
#  nickname                                   :string(255)
#  provider                                   :string(255)      default("email"), not null
#  remember_created_at                        :datetime
#  reset_password_sent_at                     :datetime
#  reset_password_token                       :string(255)
#  tokens                                     :text(65535)
#  uid                                        :string(255)      default(""), not null
#  unconfirmed_email                          :string(255)
#  created_at                                 :datetime         not null
#  updated_at                                 :datetime         not null
#  app_id(Player ID in DuelMasters-Plays app) :integer
#
# Indexes
#
#  index_users_on_confirmation_token           (confirmation_token) UNIQUE
#  index_users_on_email                        (email) UNIQUE
#  index_users_on_reset_password_token         (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider_and_app_id  (uid,provider,app_id) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20])
    user
  end
end
