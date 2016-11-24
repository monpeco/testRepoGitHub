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
#Chalenge

###Create the show action for the ZombiesController which finds a Zombie based on params[:id]. Store the Zombie object to an instance variable named @zombie.


```ruby
class ZombiesController < ApplicationController
  def show
    # put the show code here
    @zombie = Zombie.find(params[:id])
  end
end
```

###Finish the respond_to block so the action returns the XML of the @zombie record
```ruby
class ZombiesController < ApplicationController
  def show
    @zombie = Zombie.find(params[:id])

    respond_to do |format|
      format.xml { render xml:@zombie}
    end
  end
end
```

###Write a create action that will create a new Zombie from the params and then redirect to the created Zombie's show page. Make sure to use Rails 4 strong_parameters.
```ruby
class ZombiesController < ApplicationController
  def create
    @zombie = Zombie.create(zombie_params)
    redirect_to(@zombie)
  end

  private

  def zombie_params
    params.require(:zombie).permit(:name, :graveyard)
  end
end
```

###Add a before_action that calls a method to check if a Zombie has tweets. Redirect to zombies_path if the zombie doesn't have tweets, only on show.
```ruby

```


```ruby

```


```ruby

```
