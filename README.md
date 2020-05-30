# GRAPHQL-JWT-API-TEMPLATE

## Стэк

- PostgreSQL (https://www.postgresql.org/)
- Ruby on Rails (http://rubyonrails.org/)

## Интеграция

Осуществляется при помощи Capistrano (http://capistranorb.com/).

## Песочница

Для отладки и тестирования доступна песочница по адресу https://api.invest.alpha.trinitydigital.ru, обновление сервера осуществляется двумя путями:

- Загрузка обновлений в ветку `alpha`: `git checkout alpha && git merge changeset && git push origin alpha`
- Непосредственный вызов задачи `deploy`: `git checkout alpha && bundle install && bundle exec cap alpha deploy`

## Код

Общие рекомендации по стилю кода: https://github.com/bbatsov/ruby-style-guide

## Пагинация

Используется gem kaminari (https://github.com/kaminari/kaminari)

## Дата и время

Все временные метки форматируются в https://en.wikipedia.org/wiki/ISO_8601

## Редактирование секретного хранилища

`EDITOR="nano" bin/rails credentials:edit --environment development`

Пример:
```yaml

secret_key_base: c00baead8d2da35bbdc521f62e52febd80f9cd3ee926480543235d6ffbbaa6312b2378ef82b60872fac268409510f729189cf334ba4b2a77cb7b694bc62644ea
jwt_secret: faab2ea4e2a91833f73975322455abaf7742e60d84abeef682a1b11b260acb63410c3001c3dba0cea1387c15a3ead09abee66d89580c68de09e4033d113d8671
database:
  database: vinfriends
  username: vinfriends
  password: vinfriends

```
## Запуск локально

Создаем БД PostgreSQL:

```sql
sudo su postgres
psql
CREATE USER vinfriends;
ALTER ROLE vinfriends SUPERUSER;
ALTER USER vinfriends WITH PASSWORD 'vinfriends';
CREATE DATABASE vinfriends OWNER vinfriends;

```

Создаем конфиг окружения:
`nano .rails-env`
Содержимое файла:
`development`

Устанавливаем зависимости:
`bundle install`

Запускаем миграции:
`rails db:migrate`

Запускаем миграции данных:
`RAILS_ENV=development rails db:seed`

Запуск:
`rails s`

## Правка шаблона письма
Взять образец верстки из папки `doc`

Изменить стили в `<head> <style>`

Прогнать через онлайн-инлайнер, например `https://templates.mailchimp.com/resources/inline-css/`


# Rails 6 API-only boilerplate with devise & JWT & graphQL

This is a boilerplate to build your next SaaS product. It's a RubyOnRails 6 API only backend with Authentication and GraphQL API. It works nicely together with clients made with **React.js & React.Native** or any other frontend which implements the [JSON Web Tokens](https://jwt.io/introduction/) philosophy. We have a demo frontend made with [gatsbyJS](https://www.gatsbyjs.org/) available here: <https://gatsby-redux.zauberware.com/>.

## Versions

- Current ruby version `2.6.x`
- Bundler version `2.1.4`
- Rails version `6.0.X`
- Postgresql Server as db connector

## Quick start

sudo su postgres
psql
CREATE USER saas;
ALTER ROLE saas SUPERUSER;
ALTER USER saas WITH PASSWORD 'saas';
CREATE DATABASE saas OWNER saas;

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/zauberware/rails-devise-graphql)

or

clone the repo:

```sh
git clone https://github.com/zauberware/rails-devise-graphql my-saas-backend
cd my-saas-backend
```

Clone `env_sample` to .env for local development. We set it up with default rails `3000` and gatsby `8000` ports:

```sh
cp env_sample .env
```

Install the bundle:

```sh
bundle install
```

Make sure the postresql is running on localhost. You may have to change your credentials under `/config/database.yml`:

```sh
rake db:create
rake db:migrate
rake db:seed
```

Run the development server:

```
rails s
```

While this is an API-only application you will not be able to access any routes via browser. Download a GraphQL client like [GraphiQL](https://github.com/graphql/graphiql) or others. 

Point the GraphQL IDE to `http://0.0.0.0:3000/graphql`

**Note:** Make sure that the `.env` file is included in the root of your project and you have defined `CLIENT_URL` and `DEVISE_JWT_SECRET_KEY`. You can try out the [Demo frontend](https://github.com/zauberware/gatsby-starter-redux-saas) or you implement the actions in any other client. Read more about the JSON Web Token [this](https://github.com/zauberware/rails-devise-graphql). There are plenty of packages available.

## What's included?

### 1. Database
The app uses a postgresql database. It implements the connector with the gem `pg`. The app already includes a `User` model with basic setup.

### 2. Authentication
The app uses [devise](https://github.com/plataformatec/devise)'s logic for authentication. Emails are currently disabled in the environment settings.

### 3. JSON Web Token
[devise-jwt](https://github.com/waiting-for-dev/devise-jwt) is a devise extension which uses JWT tokens for user authentication. It follows [secure by default](https://en.wikipedia.org/wiki/Secure_by_default) principle.

### 4. GraphQL
[graphql-ruby](https://github.com/rmosolgo/graphql-ruby) is a Ruby implementation of GraphQL. Sadly it's not 100% open source, but with the free version allows you amazing things to do. See the [Getting Started Guide](https://graphql-ruby.org/) and the current implementations in this project under `app/graphql/`.

### 5. CORS
Protect your app and only allow specific domains to access your API. Set `CLIENT_URL=` in `.env` to your prefered client. If you need advanced options please change the CORS settings here `config/initializers/cors.rb`.

### 6. App server
The app uses [Puma](https://github.com/puma/puma) as the web serber. It is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications in development and production.

### 7. Testing

We are using the wonderful framework [rspec](https://github.com/rspec/rspec). The testsuit also uses [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) for fixtures. 

Run `rspec spec` 

### 8. Deployment
The project runs on every webhoster with ruby installed. The only dependency is a PostgreSQL database. Create a block `production:` in the`config/database.yml` for your connection.

#### Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/zauberware/rails-devise-graphql)

Choose the one click installer or push a clone of this repo to heroku by yourself. We added a `Profile` to the project and heroku run the `release:` statement after deploying a new version. Heroku will automatically set the db settings for your project, so there is nothing to do in `config/database.yml`.


**Make sure all ENV vars are set and the database settings are valid.**

#### Bitbucket Pipelines
If you want to use [bitbucket pipelines](https://bitbucket.org/product/de/features/pipelines) for CI you can use the sample file `bitbucket-pipelines.yml` in the project root.

Make sure to set ENV vars `$HEROKU_API_KEY` and `$HEROKU_APP_NAME` in bitbuckets pipeline settings. (Will appear after enabling pipelines for your project.)

The pipeline has 2 environments: staging and production. Staging pipline is getting triggered in `develop` branch. Production uses all `release-*` branches.


### 9. Frontend

#### GatsbyJS

If you need a frontend than have a look at this basic [Gatsby boilerplate](https://github.com/zauberware/gatsby-starter-redux-saas). A Gatsby Redux SaaS starter for your next SaaS product. Uses react-redux, apollo-client, magicsoup.io, styled-components, styled-system.

![zauberware technologies](https://github.com/zauberware/gatsby-starter-redux-saas/raw/master/static/website-preview.jpg)


## What's missing?

* Specs for devise lockable
* Implementation for devise confirmable
* Implementation for omniauthable


Feel free to join development!

## Author

__Script:__ <https://github.com/zauberware/rails-devise-graphql>  
__Author website:__ [https://www.zauberware.com](https://www.zauberware.com)    

![zauberware technologies](https://avatars3.githubusercontent.com/u/1753330?s=200&v=4)
