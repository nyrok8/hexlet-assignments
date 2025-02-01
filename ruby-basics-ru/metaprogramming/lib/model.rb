# frozen_string_literal: true

# BEGIN
require 'date'

module Model
  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", transform_value(value, self.class.types[key.to_sym]))
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attribute(name, options = {})
      @types ||= {}
      @types[name] = options[:type]
      
      define_method(name) do
        instance_variable_get("@#{name}")
      end
      
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", transform_value(value, self.class.types[name]))
      end
    end
    
    def types
      @types || {}
    end
  end

  def attributes
    self.instance_variables.reduce({}) do |hash, var|
      hash[var.to_s.delete('@').to_sym] = instance_variable_get(var)
      hash
    end
  end

  def transform_value(value, type = nil)
    return nil if value.nil?

    case type
    when :integer
      value.to_i
    when :string
      value.to_s
    when :boolean
      !!value
    when :datetime
      DateTime.parse(value)
    else
      value
    end
  end
end
# END