# User
```console
rails g scaffold User username email role critics_count:integer
```
# Critic # Falta hacer la relacion polimórfica
```console
rails g scaffold Critic title body:text user:references
```
# Game # falta parent_id SELF JOIN
```Game
rails g scaffold Game name summary:text release_date:date category:integer rating:decimal cover:attachment 
```
# Platform # many to many
```console
ralis g scaffold Platform name category:integer
```
# Genre # many to many
```console
ralis g scaffold Genre name
```
# Company
```console
ralis g scaffold Company name description:text start_date:date country:string cover:attachment
```
# InvolvedCompany
```console
rails g scaffold InvolvedCompany company:references game:references developer:boolean publisher:boolean
```


#
#
# 
# Modifying app
# Configurar Scaffolds -- controllers
# User model
```User model
...
has_many :critics
...
```
# MIGRATION for polymorphic
```console
rails g migration AddCriticableToCritic criticable:references{polymorphic}
```
```Migration
class AddCriticableToCritic < ActiveRecord::Migration
  def change
    add_reference :critic, :criticable, polymorphic: true, index: true
  end
end
```
```Company model
...
has_many :critics, as: :criticable
...
```
```Game model
...
has_many :critics, as: :criticable
...
```
# Critic model # counter_cache
```console
...
belongs_to :user, counter_cache: true
...
```
# MIGRATION Join table Game Platform
```console
rails g migration CreateJoinTableGameToPlatform game platform
```
# MIGRATION Join table Game Genre
```console
rails g migration CreateJoinTableGameToGenre game genre
```
# Self join Game
