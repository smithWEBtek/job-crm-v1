# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies



  to create ERD diagrams, follow these instructions, pasted from: http://voormedia.github.io/rails-erd/install.html
      Rails ERD generates diagrams using Graphviz, a visualisation library. Continue to read how to install Graphviz and Rails ERD, so you can start creating model diagrams.

      Install Graphviz
      Rails ERD requires Graphviz. To install it, try one of the following...

      % brew install graphviz           # Homebrew on Mac OS X
      % sudo port install graphviz      # Macports on Mac OS X
      % sudo aptitude install graphviz  # Debian and Ubuntu
      Graphviz 2.22+ is recommended. Earlier versions may work, but many bugs have been fixed since. If you have trouble with earlier versions, you may wish to disable indirect relationships. Learn more.

      Install Rails ERD
      Rails ERD runs on all Rails 3 platforms: Ruby 1.8/1.9, Rubinius, or JRuby all work fine. Add Rails ERD as a plugin to your Ruby on Rails 3 application. In your Gemfile...

      group :development do
        gem "rails-erd"
      end
      Bundler will install everything you need...

      % bundle install
      Generate your first diagram
      You now have a new Rake task in your application. Generate an up-to-date model diagram with...

      % rake erd
      Done! Open ERD.pdf to view your diagram. Not completely satisfied? You can customise the output.

      Not using Rails?
      If you use Active Record 3 outside of a Rails application, you can also use Rails ERD to create model diagrams for you. Install the rails-erd gem, load your models, and execute...

      # Make sure all your models are loaded.
      require "rails_erd/diagram/graphviz"

      RailsERD::Diagram::Graphviz.create
      Having trouble?
      If Rails ERD doesn't work like you expected it to, don't give up immediately. First of all, check if you can generate a graph without rendering it...

      % rake erd filetype=dot
      Check for a file named ERD.dot, and see if it's not empty. If everything worked so far, Rails ERD is probably working fine. You can either tweak the output before processing it with dot (the command line tool that ships with Graphviz), or you can try with a very recent version of Graphviz, preferrably 2.26+.

      If things are still not running smoothly, I'd love to hear from you. You can either create a new issue, or drop me a line at r.timmermans at voormedia.com. If something goes wrong while generating a diagram, please provide a set of example models that exhibit the problem.



* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
