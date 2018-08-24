# NASA Image Search

### Development:

Install them gems:

    gem install bundler
    bundle

Setup the database:

    rake db:create db:migrate db:test:prepare

Run the tests:

    rspec

Check the coverage:

    gnome-open coverage/index.html

(or what ever the MacOS equivalent is, if you're into that sort of thing)

Awesome music with your tests:

    sudo apt-get install mpg321
    rspec -f NyanCatMusicFormatter
