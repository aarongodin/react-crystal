module React
  extend self
  
  private def guard_dir(path)
    unless File.directory? path
      raise MissingDirectoryError.new "Did not find a directory at #{path}"
    end
  end

  private def guard_file(path)
    unless File.exists? path
      raise MissingFileError.new "Did not find a file at #{path}"
    end
  end
end
