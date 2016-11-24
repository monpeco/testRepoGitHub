#Level 4

###Url
```
/tweets?tweet[status]=Im dead
```
###params[]
```
params = { 
          tweet : {
                   status: "Im dead"
                  }
         }
```	
###Long version of create with params
```ruby
@tweet = Tweet.create(status: params[:status])
```
###Shor version of create with params
```ruby
@tweet = Tweet.create(params[:tweet])
```

###Creation with strong parameters
@tweet = Tweet.create(params.requiere(:tweet).permit(:status))

###If multiple parameters
params.requiere(:tweet).permit([:status, :location])

###Respong with XML or JSON
If we send:
```
/tweets/1.json
```
in the file:
```
/app/controllers/tweets_controller.rb
```
We must add:
```ruby
class TwettsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json:@tweet }
  end
end
```
For XML:
```ruby
class TwettsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      format.html #show.html.erb
      format.xml { render xml:@tweet }
  end
end
```

###Controller actions
```ruby
class TweetsController < ApplicationController
  
  def index #List all tweet
  
  def show #show a single tweet
  
  def new #Show a new tweet form
  
  def edit #show a edit tweet form

  def create #create a new tweet

  def update #update a tweet

  def destroy #delete a tweet
  
end
```

###Redirect and Flash

```ruby
class TweetsController < ApplicationController
  def edit
    @tweet = Tweet.find(params[:id])
    
    if session[:id] != @tweet.zombie_id
      flash[:notice] = "Sorry, you can't edit this tweet"
      redirect_to(tweets_path)
    end
  end
end
```

```ruby
redirect_to(tweets_path, notice: "Sorry, you can't edit this tweet")
```

###Notice for layouts
In the file:
```
/app/views/layouts/application.html.erb
```

```html
<body>
  <header> </header>
  <% if flash[:notice] %>
    <div id="notice"><%= flash[:notice] %> </div>
  <% end %>
  
  <%= yield %>
</body>
```

###Before Actions

```ruby
class TweetsController < ApplicationController
  
  before_action :get_tweet, only: [:edit, :update, :destroy]
  before_action :get_tweet, :only => [:edit, :update, :destoy]
  
  def get_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def check_auth
    if session[:zombie_id] != @tweet.zombie_id
      flash[:notice] = "Sorry, you can't edit this tweet"
      redirect_to(tweets_path)
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
```