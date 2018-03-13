# AppVeyor::Worker

[![Build status](https://ci.appveyor.com/api/projects/status/oiqm2v8jcr9td1la?svg=true)](https://ci.appveyor.com/project/ukoloff/appveyor-worker)
[![Gem Version](https://badge.fury.io/rb/appveyor-worker.svg)](http://badge.fury.io/rb/appveyor-worker)

Access to [AppVeyor][]
[Build Worker API][].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'appveyor-worker' # if ENV['APPVEYOR_API_URL']
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

### Minitest

When using `AppVeyor::Worker` under
[Minitest][]
the latter automagically requires the former.
Just add to `Gemfile` et voila! Test results will populate list
and `AppVeyor::Worker.message` is available in your tests.

In addition, Minitest seed will be sent as AppVeyor message.

### RSpec

For [RSpec][] you need *two* lines of code, as mentioned above:

1. Add gem to `Gemfile`
2. Require gem

    * Either directly in one of your `./spec/*_spec.rb` files
    * Or by adding `-r appveyor/worker` to `./.rspec'

RScpec seed is also reported as standard AppVeyor message.

[AppVeyor]: http://www.appveyor.com/
[Build Worker API]: http://www.appveyor.com/docs/build-worker-api
[Minitest]: https://github.com/seattlerb/minitest
[RSpec]: http://rspec.info/
