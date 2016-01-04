after :user do
  user = User.first
  20.times { News.create(name: 'News Title', body: 'News Body', user: user) }
end