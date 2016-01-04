User.create(public_nickname: 'iAmUser', email: 'test@mail.com', password: 'password', password_confirmation: 'password', confirmed_at: Date.today)
User.create(public_nickname: 'iAmUser1', email: 'test1@mail.com', password: 'password', password_confirmation: 'password', confirmed_at: Date.today)
User.create(public_nickname: 'admin', email: 'admin@mail.com', role: 2, password: 'password', password_confirmation: 'password', confirmed_at: Date.today)
