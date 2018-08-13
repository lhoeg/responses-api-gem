# Responses API Gem

Welcome to the Responses API Gem! This gem provides a way of interacting with [Typeforms Responses API](https://developer.typeform.com/responses/) if you are programming in Ruby.

This gem is heavily inspired by [Typeform/create-api-gem](https://github.com/Typeform/create-api-gem).

## Getting Started

So before using the gem we recommend familiarizing yourself a little bit with our API. You can check out our [Get-Started](https://developer.typeform.com/get-started/) documentation.

You will also need a [Personal Access Token](https://developer.typeform.com/get-started/personal-access-token/) if you want to see anything you make with this gem appear in your Typeform account.

Once you have this token, we recommend for security reasons saving it as an `TYPEFORM_API_TOKEN` environment variable. Also it will save you writing some code later on, if you don't want to do this just yet it is still possible to use the gem, but as we say - it is recommended.

### Installation

Add this line to your application's Gemfile:

`gem 'responses_api_gem', git: 'https://github.com/lhoeg/responses-api-gem.git'`

And then execute:

`bundle install`

Wherever you use the gem, it is easiest to require it like so:

```
require 'bundler'
Bundler.require
```

This should require all the gems in your Gemfile for you.

### Usage

Now we're ready to develop. Let's say you have a form, you will retrieve the last page of responses using a `RetrieveResponsesRequest`

`responses = ResponsesApi::RetrieveResponsesRequest.execute('form-id').responses` - voila!

(We use `.execute` instead of `.new` on the `RetrieveResponsesRequest` to check that we get back the correct status code)

Note: This will only work if you have set the environment variable as mentioned before. You can explicitly pass a token like this

`ResponsesApi::RetrieveResponsesRequest.execute('form-id, token: 'your-token-goes-here')`

The returned responses are sent through Hashie to simplify access. This can be disabled by adding parameter `hashie: false` to responses

`responses = ResponsesApi::RetrieveResponsesRequest.execute('form-id').responses(hashie: false)`

## Development

After checking out the repo, you can run `rake console` to load the gem using the interactive ruby console.

## Code of Conduct

[See our code of conduct here](CODE_OF_CONDUCT.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lhoeg/responses-api-gem.

When writing Ruby code we use *Rubocop* as a static code analyzer. You can run `rubocop` from the route folder to make sure that your code fits the conventions we have set inside the '.rubocop.yml' file.

### Versioning

We follow the semantic versioning as defined by rubygems.org

## Alternatives

This is just a Ruby wrapper for our API's, they use the JSON format so they are extremely flexible. There are many alternatives!

Check out our developers documentation at developers.typeform.com

## Legal

Copyright 2018 Lars Hoeg. under the Apache 2 License; see the LICENSE file for more information.

This is not an official Typeform product.
