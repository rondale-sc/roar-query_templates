class QueryTemplateBuilder
  attr_accessor :template

  def initialize(name)
    self.template ||= {}
    self.name = name
  end

  def url=(val)
    template[:url] = val
  end

  def url
    "#{template[:url]}?#{url_params}"
  end

  def name=(value)
    template[:name] = "#{value}_query"
  end

  def name
    template[:name]
  end

  def add_param(key, val="")
    template[:params] ||= Hash.new
    template[:params][key] = val
  end

  def url_params
    template[:params].map do |key,value|
      "#{key}={#{key}}"
    end.join("&")
  end

  def params
    template[:params]
  end

  def http_method=(val)
    template[:http_method] = val
  end

  def http_method
    template[:http_method]
  end

  def to_json

    require 'pry'; binding.pry
  end
end
