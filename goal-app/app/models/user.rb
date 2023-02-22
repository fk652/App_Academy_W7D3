# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    validates :username, :password, presence: true
    validates :username, uniqueness: true

    
    def self.find_by_credentials(un, pw)
        @user = User.find_by(username: un)
        if @user && @user.password == pw
            return true
        end
        return false
    end

end
