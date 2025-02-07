# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version

-ruby -v

## Make sure Rails is installed

-rails -v

If you see Ruby and Rails version then you are good to start, other wise Setup Ruby On Rails on Ubuntu

Once done, Now

## Clone respected git repository

- git clone https://github.com/martynbiz/human_services_finder.git

## Install all dependencies

- bundle install

## Create db and migrate schema

- rake db:create
- rake db:migrate

## Now run your application

- rails s

p.s If you are not using RVM yet I would strongly recommend doing so!

## Creation du projet

rails new auth_api_rails --api --database=postgresql -T

## Configuration Cors

- Configure CORS in config/initializers/cors.rb:
- # config/initializers/cors.rb
- Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
  origins 'http://localhost:3000'
  resource(
  '\*',
  headers: :any,
  expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
  methods: [:get, :patch, :put, :delete, :post, :options, :show]
  )
  end
  end

