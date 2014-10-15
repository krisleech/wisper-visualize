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
report.to_png('/tmp/events-graph.png')
```

You can also get a collection of all events published:

```ruby
report.events # => [...]
```

Each event has the following attributes:

```ruby
event.name
event.publisher_name
event.subscriber_name
event.arg_names
event.created_at
event.frequency
```

## Rspec

```ruby
around(:each) do |example|
  report = Wisper::Visualize.report
  example.call
  report.to_pdf("/tmp/events-graph-#{example.metadata[:full_description]}.pdf")
end
```

## Contributing

Yes, please.
