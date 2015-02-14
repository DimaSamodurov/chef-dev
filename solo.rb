project_path = File.expand_path("..", __FILE__) 

cookbook_path [File.join(project_path, 'cookbooks'), File.join(project_path, 'site-cookbooks')]
json_attribs  File.join project_path, 'node.json'


