# AppVeyor::Worker

[![Build status](https://ci.appveyor.com/api/projects/status/oiqm2v8jcr9td1la?svg=true)](https://ci.appveyor.com/project/ukoloff/appveyor-worker)

Access to [AppVeyor](http://www.appveyor.com/)
[Build Worker API](http://www.appveyor.com/docs/build-worker-api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'appveyor-worker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install appveyor-worker

## Usage

```ruby
require 'appveyor/worker'

AppVeyor::Worker.message "Hello, world!", "It's me"
```
