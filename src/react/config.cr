module React
  @@component_directory : String?
  @@react_stdio_executable = "react-stdio"

  extend self

  def component_directory=(path : String)
    guard_dir path
    @@component_directory = path
  end

  def component_directory
    @@component_directory
  end

  def react_stdio_executable=(path : String)
    guard_file path
    @@react_stdio_executable = path
  end

  def react_stdio_executable
    @@react_stdio_executable
  end
end
