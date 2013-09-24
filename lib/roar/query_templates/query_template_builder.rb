class QueryTemplateBuilder
  attr_accessor :template

  def initialize
    self.template ||= {}
  end

  def url=(val)
    template[:url] = val
  end

  def url
    "#{template[:url]}?#{url_params}"
  end

  def name=(val)
    template[:name] = val
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

  def self.build_template
    query_template_builder = self.new
    yield query_template_builder
    return query_template_builder
  end
end
