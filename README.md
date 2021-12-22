# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Usage

### Setup

```sh
docker compose run --rm bundle install
docker compose run --rm bundle exec rails db:migrate db:seed
docker compose up -d
docker compose run --rm bundle exec rails c
```

### Twirp

```ruby
client = ThingsClient.new('http://app:3000')
client.index(ThingFilter.new)

=>
#<Twirp::ClientResp:0x0000aaaae2e98af8
 @data=
  <ThingList: things: [<ThingResponse: id: 1, name: "Thing 0">, <ThingResponse: id: 2, name: "Thing 1">, <ThingResponse: id: 3, name: "Thing 2">, <ThingResponse: id: 4, name: "Thing 3">, <ThingResponse: id: 5, name: "Thing 4">, <ThingResponse: id: 6, name: "Thing 5">, <ThingResponse: id: 7, name: "Thing 6">, <ThingResponse: id: 8, name: "Thing 7">,
  ...
```
