module ServerConfiguration

  def self.config_yaml
    @@config_yaml ||= YAML.load_file("#{Rails.root}/config/server_configuration.yml")
  end

  def self.load
    yaml = YAML.load_file("#{Rails.root}/config/server_configuration.yml")
    @@parameters = []
    yaml.each do |k,v|
      @@parameters << k.to_sym
      define_singleton_method k.to_sym do
        v
      end
    end
  end

  def self.parameters
    @@parameters ||= []
  end

  def self.display
    unless parameters.present?
      load
    end
    parameters.each do |param|
      puts "#{param}: #{self.send(param)}"
    end
  end

end
