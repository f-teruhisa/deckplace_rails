# == Schema Information
#
# Table name: users
#
#  id                                         :bigint           not null, primary key
#  current_sign_in_at                         :datetime
#  email                                      :string(255)      default(""), not null
#  encrypted_password                         :string(255)      default(""), not null
#  failed_attempts                            :integer          default(0), not null
#  last_sign_in_at                            :datetime
#  locked_at                                  :datetime
#  name(User name in this Application)        :string(255)
#  provider                                   :string(255)
#  remember_created_at                        :datetime
#  reset_password_sent_at                     :datetime
#  reset_password_token                       :string(255)
#  sign_in_count                              :integer          default(0), not null
#  uid                                        :string(255)
#  unlock_token                               :string(255)
#  created_at                                 :datetime         not null
#  updated_at                                 :datetime         not null
#  app_id(Player ID in DuelMasters-Plays app) :integer
#
# Indexes
#
#  index_users_on_email                        (email) UNIQUE
#  index_users_on_reset_password_token         (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider_and_app_id  (uid,provider,app_id) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:id) { |i| i }
  end
end
