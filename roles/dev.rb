name 'dev'

run_list(
    'recipe[java]',
    'recipe[imagemagick]',
    #'recipe[rvm::user]',
    'recipe[bootstrap::mongodb]',
    'recipe[bootstrap::productivity]'
)

default_attributes(
    'java' => {'install_flavor' => 'oracle',
               'jdk_version' => '7',
               'oracle' => {'accept_oracle_download_terms' => true}},
    'rvm' => {'installs' => {
        'gpg_key' => '409B6B1796C275462A1703113804BB82D39DC0E3',
        'dev' => {
            'default_ruby' => 'ruby-2.2.0',
            'user_default_ruby' => 'ruby-2.2.0',
            'rubies' => ['2.2.0']
        }
    }})

