module CustomConstMissing
  extend self

  mattr_accessor :mapping
  self.mapping = {}

  def const_missing(const_name, *args)
    log "const_missing: #{const_name}"
    const_name = const_name.to_sym
    if mapping.has_key? const_name
      file = mapping[const_name]
      require_dependency file
      raise LoadError, "Expected #{file} to define #{const_name}" unless const_defined?(const_name)
      return const_get(const_name)
    else
      super
    end
  end

  def map(const, file)
    mapping[const] = file
  end

  def hook!
    Module.class_eval { include CustomConstMissing }
  end

  def log(msg)
    @logger ||= Logger.new(STDOUT)
    @logger.debug "CustomConstMissing: #{msg}"
  end
end
