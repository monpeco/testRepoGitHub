###VIEWS SIMPLE

####Print out the zombie's name and graveyard.
####app/views/zombies/show.html.erb
```ruby
    <% zombie = Zombie.first %>
    <h1><%= zombie.name %></h1>
    <p>
      <%= zombie.graveyard %>
    </p>
```
####result
```html
    <h1>Ashley</h1>
    <p>
      Glen Haven Memorial Cemetery
    </p>
```

###Link to the zombie's show page. Use the zombie's name as the anchor text
```ruby
    <% zombie = Zombie.first %>
    <p>
    <%= link_to zombie.name, zombie %>
    </p>
```
####result
```html
    <p>
    <a href="/zombies/1">Ashley</a>
    </p>
```

###Use an each block to print the names of all the zombies.
```ruby
    <% zombies = Zombie.all %>
    <ul>
    <% zombies.each do |z| %>
      <%= z.name %>
    <% end %>
    </ul>
```
####result
```html
    <ul>
      Ashley
      Bob
      Katie
    </ul>
```
###In the each block, if a zombie has more than one tweet, print out SMART ZOMBIE.
```ruby    
    <% zombies = Zombie.all %>
    <ul>
      <% zombies.each do |zombie| %>
        <li>
          <%= zombie.name %>
          <% if(zombie.tweets.count > 1) %>
            <%= "SMART ZOMBIE" %>
          <% end %>      
        </li>
      <% end %>
    </ul>
```    
####result
```html
    <ul>
        <li>
          Ashley
            SMART ZOMBIE
        </li>
        <li>
          Bob
        </li>
        <li>
          Katie
        </li>
    </ul>
```

###In the each block, make the zombie's name link to its edit page.
```ruby
    <% zombies = Zombie.all %>
    <ul>
      <% zombies.each do |zombie| %>
        <li>
          <%= link_to zombie.name, edit_zombie_path(zombie)%>
        </li>
      <% end %>
    </ul>
```    
####result
```html    
    <ul>
        <li>
          <a href="/zombies/1/edit">Ashley</a>
        </li>
        <li>
          <a href="/zombies/2/edit">Bob</a>
        </li>
        <li>
          <a href="/zombies/3/edit">Katie</a>
        </li>
    </ul>
```


















