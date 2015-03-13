# Usage: just add recipe[mongodb::10gen_repo] to the node run_list before any other MongoDB recipe,
# and the mongodb-10gen stable packages will be installed instead of the distribution default.
include_recipe 'mongodb::10gen_repo'
include_recipe 'mongodb::default'
