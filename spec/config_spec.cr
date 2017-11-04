require "./spec_helper"

describe "Config" do
	describe "component_directory" do
		it "should raise when the directory does not exist" do
			expect_raises React::MissingDirectoryError do
				React.component_directory = File.expand_path("spec/sup")
			end
		end

		it "should set when the directory exists" do
			path = File.expand_path("spec/support")
			React.component_directory = path
			React.component_directory.should be path
		end
	end

	describe "react_stdio_executable" do
		it "should raise when the file does not exist" do
			expect_raises React::MissingFileError do
				React.react_stdio_executable = File.expand_path("./react-stdio")
			end
		end

		it "should set when the directory exists" do
			path = File.expand_path("spec/support/react-stdio")
			React.react_stdio_executable = path
			React.react_stdio_executable.should be path
		end
	end
end
