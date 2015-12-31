require 'jsonapi/counting_total_pages_operations_processor'
JSONAPI.configure do |config|
  config.operations_processor = :counting_total_pages
  config.exception_class_whitelist = [Pundit::NotAuthorizedError]
end