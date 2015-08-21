module ServerConfiguration

  def self.config_yaml
    @@config_yaml ||= YAML.load_file("#{Rails.root}/config/server_configuration.yml")
  end

  puts config_yaml

  # def self.elastic_search_endpoint
  #   @@elastic_search_endpoint ||= config_yaml["elastic_search_endpoint"]
  # end

  # def self.redis_endpoint
  #   @@redis_endpoint ||= config_yaml["redis_endpoint"]
  # end

  # def self.force_ssl
  #   @@force_ssl ||= config_yaml["force_ssl"]
  # end

  # def self.fog_directory
  #   @@fog_directory ||= config_yaml["fog_directory"]
  # end

  # def self.asset_host
  #   @@asset_host ||= config_yaml["asset_host"]
  # end

  # def self.elastic_search_namespace
  #   @@elastic_search_namespace ||= config_yaml["elastic_search_namespace"]
  # end

  # def self.limit_emails_in_environment
  #   @@limit_emails_in_environment ||= config_yaml["limit_emails_in_environment"]
  # end

  # def self.perform_basic_auth
  #   @@perform_basic_auth ||= config_yaml["perform_basic_auth"]
  # end

  # def self.action_mailer_host
  #   @@action_mailer_host ||= config_yaml["action_mailer_host"]
  # end

  # def self.enable_resque
  #   @@enable_resque ||= config_yaml["enable_resque"]
  # end

  # def self.basic_auth_user
  #   @@basic_auth_user ||= config_yaml["basic_auth_user"]
  # end

  # def self.basic_auth_password
  #   @@basic_auth_password ||= config_yaml["basic_auth_password"]
  # end

  # def self.google_analytics
  #   @@google_analytics ||= config_yaml["google_analytics"]
  # end

  # def self.environment
  #   @@environment ||= config_yaml["environment"]
  # end

  # def self.cache_host
  #   @@cache_host ||= config_yaml["cache_host"]
  # end

  # def self.aws_access_key_id
  #   @@aws_access_key_id ||= config_yaml["aws_access_key_id"]
  # end

  # def self.aws_secret_access_key
  #   @@aws_secret_access_key ||= config_yaml["aws_secret_access_key"]
  # end

  # def self.log_level
  #   @@log_level ||= config_yaml['log_level']
  # end

  # def self.factset_endpoint
  #   @@factset_endpoint ||= config_yaml['factset_endpoint']
  # end

  # def self.factset_user
  #   @@factset_user ||= config_yaml['factset_user']
  # end

  # def self.factset_password
  #   @@factset_password ||= config_yaml['factset_password']
  # end

  # def self.display
  #   puts "elastic_search_endpoint: %s" % self.elastic_search_endpoint
  #   puts "redis_endpoint: %s" % self.redis_endpoint
  #   puts "force_ssl: %s" % self.force_ssl
  #   puts "fog_directory: %s" % self.fog_directory
  #   puts "asset_host: %s" % self.asset_host
  #   puts "elastic_search_namespace: %s" % self.elastic_search_namespace
  #   puts "limit_emails_in_environment: %s" % self.limit_emails_in_environment
  #   puts "perform_basic_auth: %s" % self.perform_basic_auth
  #   puts "action_mailer_host: %s" % self.action_mailer_host
  #   puts "enable_resque: %s" % self.enable_resque

  #   puts "factset_endpoint: %s" % self.factset_endpoint
  #   puts "factset_user: %s" % self.factset_user
  #   puts "factset_password: %s" % self.factset_password
  # end

end
