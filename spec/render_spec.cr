require "./spec_helper"

describe "Render" do
  describe "RenderOptions" do
    it "should accept arguments and cast properly" do
      o = React::RenderOptions.new "comp", { "test" => "test"}, "renderToString"
      o.to_json.should eq %({"component":"comp","props":{"test":"test"},"render":"renderToString"})
    end
  end

  describe "render_to_string" do
    it "should raise if the component file does not exist" do
      expect_raises React::MissingFileError do
        React.render_to_string "comp"
      end
    end

    it "should render a component" do
      output = React.render_to_string File.expand_path("spec/support/TestComponent.js")
      output.should be_a String
    end
  end
end