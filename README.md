# RockScissorsPaper

This is gem that creates rock,scissor,papper page in your webpage
you need devise gem, and user model!

## Installation

This gem is dependent to devise gem. If you don't, [please install it](https://github.com/plataformatec/devise).
Add this line to your application's Gemfile:

```ruby
gem 'rock_scissors_paper', :git => 'https://github.com/Karoid/rock_scissors_paper'
```

And then execute:
```bash
$ bundle
```
then make database for rock_scissor_papper!
```bash
$ rails g rock_scissors_paper MODEL
```
this will make migration file for the game points
```bash
$ rake db:migrate
```
then you can do your game in route "/game/rsp"
## Customization

설정을 바꾸고 싶으시다면 위의 명령어를 쳐서 만든 /config/initializers/rock_scissors_paper.rb 파일에 설정을 수정하시면 됩니다.
```ruby
RockScissorsPaper.setup do |config|
  #Devise 잼으로 만든 모델의 이름을 넣습니다
  config.user_model_name = "user"

  #라우트를 수동으로 사용하고 싶으면 주석을 푸세요
  #config.automatic_routes_mount = false

  #기존의 application layout을 사용하고 싶으시다면 주석을 푸세요
  #config.use_layout = true

  #여기는 건들 일이 거의 없을겁니다. 생성한 모델 클래스를 설정해줍니다.
  config.default_model = Point

  #공지사항이 있으면 여기에 url 주소를 적으면 공지 보기라는 링크가 생성됩니다
  #config.notice_route = "/game/notice"

  #처음 게임하게 될때 지급할 포인트를 설정합니다.
  #config.initial_point = 5000
end
```
조만간 점수를 추가하는 메소드와 차감하는 메소드를 추가할 예정입니다.

## Usage
Want to change points? Use these methods
```ruby
change_points(points)
#=> change current user point as much as you put number (can put negetive number)
set_points(points)
#=> set current user point as much as you put number (cannot put negetive number)
```
Want to check points? Use this
```ruby
current_points #=> return current user point
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Karoid/rock_scissors_paper.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
