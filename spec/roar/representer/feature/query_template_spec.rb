require 'spec_helper'

module DoubleRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  query do |template|
    template.name = "Foo"
    template.url = "/somewhere.json"
    template.http_method = "GET"
    template.add_param("limit", "the limit")
    template.add_param("offset", "the offset")
  end
end

describe "Roar::Representer::Feature::QueryTemplate" do
  let(:represented) { double("dummy").extend(DoubleRepresenter) }

  let(:expected_result) do
      {
        name: "Foo",
        url: "/somewhere.json?limit={limit}&offset={offset}",
        http_method: "GET",
        params: {
          limit:  "the limit",
          offset: "the offset",
        }
      }
  end

  it "adds params" do
    require 'pry'; binding.pry
    expect(represented.to_json["queries"].first).to eq(expected_result)
  end
end
