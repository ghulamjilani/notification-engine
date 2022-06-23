user = User.new(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')
user.add_role('admin') if user.save
