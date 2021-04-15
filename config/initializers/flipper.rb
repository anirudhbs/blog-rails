require 'flipper/adapters/active_record'
Flipper.configure do |config|
  config.default do
    Flipper.new(Flipper::Adapters::ActiveRecord.new)
  end
end

Flipper.register(:admins, &:admin?)

Flipper.disable :publish
