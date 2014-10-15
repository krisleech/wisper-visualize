# Wisper::Visualize

Provides a graph of published events as a PNG or PDF.

## Installation

```ruby
gem 'wisper-visualize'
```

## Usage

```ruby
report = Wisper::Visualize.report

# ...

report.to_pdf('/tmp/events-graph.pdf')
```

You can also get a collection of all events published:

```ruby
report.events # => [...]
```

Each event has the following attributes:

```ruby
event.publisher_class
event.publisher_id

event.subscriber_class
event.subscriber_id

event.created_at
event.name

event.arguments
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wisper-visualize/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
