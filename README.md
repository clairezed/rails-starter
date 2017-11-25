## Rails starter

Rails personal project base

## Getting Started

*These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.*
-> TODO

### Prerequisites

- ruby 2.4.2
- rails 5.1.2
- postgresql


### Installing

#### With Docker

You need first to have [docker](https://docs.docker.com/engine/installation/) & [docker-compose](https://docs.docker.com/compose/install/) installed.

```bash
cp config/database.docker.yml config/database.yml

# you may have to start docker commands with `sudo` (depending on how you did install docker)

# build app via docker compose
docker-compose build

# on first install, create the database, apply migrations and data seeds
docker-compose run web rake db:setup

# you may need to install yarn packages
docker-compose run web yarn

docker-compose up
# Ctrl + C to exit
```

#### With the standard configuration

You need first to have postgresql installed and running on your OS

```bash
git clone git@github.com:clairezed/rails-starter.git
cd rails-starter
bundle install
yarn install
```

Database configuration :

    cp config/database_example.yml config/database.yml
    # Update database.yml to cope with your own database connection credentials
    sudo -i -u postgres
    psql
    create role XXX with createdb login password 'XXX';
    # Ctrl + D to exit
    bin/rake db:setup
    bin/rake db:seed
    rails server


Your website should be accessible at [localhost:3000](http://localhost:3000/).

##### Mailcatcher

Email notifications are caught by [MailCatcher](https://mailcatcher.me/) in development. Install it globally (outside of your project folder) if you haven't yet : `gem install mailcatcher` 

Start the service outside of your project folder : `mailcatcher`

Then, open your web browser at [localhost:1080](http://localhost:1080) to access the MailCatcher interface.

## Running

### With Docker

If you had a standard rails application and have to shut down a few services to have docker run : 
    
    # stopping mailcatcher
    lsof -i :1080
    kill [mailcatcher PID]
    # stopping postgresql
    sudo service postgresql stop 

Start the dev server

    docker-compose up

Application is available at [localhost:3000](http://localhost:3000/).
Mailcatcher is available at [localhost:1080](http://localhost:1080/).

Start a rails console in another terminal

    docker-compose run web rails console

Stop the application and remove all the containers

    docker-compose down 

> volumes defined in `docker-compose.yml` are persisted

#### Installing dependencies 

The app uses bundler as ruby dependencies manager and `yarn` as a javascript dependencies manager.

Update the gems after editing the Gemfile

    docker-compose run web bundle install
    docker-compose up --build

For javascript
    
    ```
    # add to 'dependences' group
    docker-compose run web yarn add <package-name>

    # add to 'devDependencies' group
    docker-compose run web yarn add <package-name> --dev
    ```

### With the standard configuration

This project uses `yarn` as a javascript dependencies manager. 

    # add to 'dependences' group
    yarn add <package-name>

    # add to 'devDependencies' group
    yarn add <package-name> --dev

Exemple : `yarn add jquery`

Then, in `app/assets/javascripts/application.js.coffee`, add `#= require jquery`

## Running the tests

```bash
RAILS_ENV=test rake db:setup
RAILS_ENV=test bin/rake db:seed
bundle exec rspec
```

The project could clearly have more tests. Don't hesitate to contribute, I'll be happy to help !

### Continuous Integration

There's a `.travis.yml` file to integrate with Travis CI.

### Break down into end to end tests

*Explain what these tests test and why*
-> TODO

### And coding style tests

- rubocop : based on [ruby style guide](https://github.com/bbatsov/ruby-style-guide), but [relaxed](https://github.com/janlelis/relaxed.ruby.style/blob/master/.rubocop.yml). The aim is first to get rid of `rubocop_todo.yml`, then go toward stricter style guide if needed. 
- bullet : config in `config/environments/development.rb`

## Deployment

- don't forget to change Admin password in production if you run the seeds. 

## Built With

* [Bootstrap4](https://v4-alpha.getbootstrap.com/getting-started/introduction/) - alpha6
* back office inspired by [Modular Admin](https://github.com/modularcode/modular-admin-html)

## Contributing

*Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.*
-> TODO

## Versioning

*We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).*
-> TODO

## Authors

* **Claire Zuliani** - [github account](https://github.com/clairezed)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

- back office inspired by https://github.com/modularcode/modular-admin-html


## Gotcha

### Yarn and font-awesome

#### V1

Due to sass-rails helper `font-url`, couldn't find for now an other way to have it work than :

```bash
yarn add font-awesome
```

Copy `node_modules/font-awesome/fonts/` to `app/assets/fonts`.
Add `@import "font-awesome/scss/font-awesome"` in `app/assets/stylesheets/administration.sass`.

Change `node_modules/font-awesome/scss/_path.scss` to : 

```scss
@font-face {
  font-family: 'FontAwesome';
  src: font-url('fontawesome-webfont.eot?v=#{$fa-version}');
  src: font-url('fontawesome-webfont.eot?#iefix&v=#{$fa-version}') format('embedded-opentype'),
    font-url('fontawesome-webfont.woff2?v=#{$fa-version}') format('woff2'),
    font-url('fontawesome-webfont.woff?v=#{$fa-version}') format('woff'),
    font-url('fontawesome-webfont.ttf?v=#{$fa-version}') format('truetype'),
    font-url('fontawesome-webfont.svg?v=#{$fa-version}#fontawesomeregular') format('svg');
//  src: font-url('FontAwesome.otf') format('opentype'); // used when developing fonts
  font-weight: normal;
  font-style: normal;
}
```

#### V2 

Create `app/assets/stylesheets/shared/fa-font-path-override.sass` : 

```sass
$fa-font-path:  "font-awesome/fonts/" !default
```

Add it in your sass manifest, before font-awesome :

```scss
@import "shared/fa-font-path-override"
@import "font-awesome/scss/font-awesome"
```

source : [sheerdevelopment.com/posts/using-yarn-with-rails](https://sheerdevelopment.com/posts/using-yarn-with-rails)

If problems in prod : https://blog.ronaldchacon.com/rails-5-1-yarn-webfonts-and-sass


### End writing open source docs

- Open source license : MIT, Apache 2.0, and GPLv3
- README : 
  - What does this project do? 
  - Why is this project useful?
  - How do I get started?
  - Where can I get more help, if I need it?
- Contributing guidelines
  - How to file a bug report (try using issue and pull request templates)
  - How to suggest a new feature
  - How to set up your environment and run tests
- Code of conduct


### Rails Templates resources

- https://github.com/mattbrictson/rails-template
- https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-rails/lib/rails/templates
- https://github.com/spree/spree/tree/master/cmd  


## Todo

-> Vérifier la présence de "TODO" dans le code
- [ ] régler le slideToggle 'open' du submenu


## Docker

Clear down the old Containers and Images

  # Delete all containers
  docker rm $(docker ps -a -q)
  # Delete all images
  docker rmi $(docker images -q)