require "json"

module React
  alias PropsHash = Hash(String, JSON::Type)
  EMPTY_PROPS_HASH = {} of String => JSON::Type

  class RenderOptions
    JSON.mapping(
      component: String,
      props: PropsHash,
      render: String
    )
  
    def initialize(@component, props : PropsHash, @render)
      @props = cast_props(props)
    end
  
    private def cast_props(props)
      props_casted = {} of String => JSON::Type
      props.as(Hash).keys.each {|k| props_casted[k] = props.as(Hash)[k]}
      props_casted
    end
  end

  extend self

  def render_to_string(path : String, props : PropsHash = {} of String => JSON::Type)
    resolved_path = resolve_path(path)
    guard_file resolved_path
    render RenderOptions.new resolved_path, props, "renderToString"
  end

  def render_to_static_markup(path : String, props : PropsHash = {} of String => JSON::Type)
    resolved_path = resolve_path(path)
    guard_file resolved_path
    render RenderOptions.new resolved_path, props, "renderToStaticMarkup"
  end

  private def resolve_path(path : String)
    return path if absolute?(path)

    unless @@component_directory.nil?
      return File.join @@component_directory.as(String), path
    end

    File.expand_path path
  end

  private def absolute?(path)
    path.starts_with? "/"
  end

  private def render(options)
    react_stdio_input = IO::Memory.new options.to_json
    react_stdio_output = IO::Memory.new
    begin
      Process.run "node_modules/.bin/react-stdio", input: react_stdio_input, output: react_stdio_output
      JSON.parse(react_stdio_output.to_s)["html"].as_s
    rescue e
      raise RuntimeError.new e.message
    end
  end
end
