# Demo of writing a file in a directory, creating the directory if needed.

# NB. Run this from the project root.

public_dir = '_site'
Dir.mkdir(public_dir) unless File.exists?(public_dir)

new_filename = 'content.txt'
new_filepath = "#{public_dir}/#{new_filename}"
content = 'line 1
line 2
line 3
'
File.open(new_filepath, 'w') { |file| file.write(content) }
