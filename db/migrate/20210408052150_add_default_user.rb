class AddDefaultUser < ActiveRecord::Migration[5.2]
  def change
    user = User.find_or_initialize_by(email: 'default-user@ee')
    unless user.created_at
      user.password = 'default_pwd'
      user.save!
    end
  end
end
