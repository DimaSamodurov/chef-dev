name 'dev'

run_list(
    'recipe[java]',
    'recipe[imagemagick]',
    'recipe[rvm::user]',
    'recipe[bootstrap::mongodb]',
    'recipe[bootstrap::productivity]'
)

default_attributes(
    'java' => {'install_flavor' => 'oracle',
               'jdk_version' => '7',
               'oracle' => {'accept_oracle_download_terms' => true}},
    'rvm' => {'installs' => {
        'dev' => {
            'default_ruby' => 'ruby-2.2.0',
            'user_default_ruby' => 'ruby-2.2.0',
            'rubies' => ['2.2.0']
        }
    }})

