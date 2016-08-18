# Able

This gem helps you to start develop new app simple. See usage instructions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'able'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install able

## Usage

1. [Emailable](https://github.com/entity1991/able/tree/master/lib/able/emailable.rb)
2. [Fullnameable](https://github.com/entity1991/able/tree/master/lib/able/fullnameable.rb)
    `full_name` method

3. [Tokenizer](https://github.com/entity1991/able/tree/master/lib/able/tokenizer.rb)
    Type inside your model
```ruby
  before_create do
    generate_token :api_token
    generate_uuid!
  end
```  

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/entity1991/able](https://github.com/entity1991/able).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

