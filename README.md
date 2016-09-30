# Able

This gem contains pieces of code I copy-past from one project to another one.

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

###Concerns

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

### Ruby class extensions

1. [Integer](https://github.com/entity1991/able/tree/master/lib/ext/integer.rb)
1. [Kernel](https://github.com/entity1991/able/tree/master/lib/ext/kernel.rb)
1. [String](https://github.com/entity1991/able/tree/master/lib/ext/string.rb)

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/entity1991/able](https://github.com/entity1991/able).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

