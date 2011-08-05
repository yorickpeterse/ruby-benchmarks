class Plugin
  def author(name = nil)
    @name ||= name
  end

  def self.add(name, &block)
    plugin = Plugin.new

    plugin.instance_eval(&block)

    return plugin
  end

  def self.add_yield(name)
    plugin = Plugin.new

    yield plugin

    return plugin
  end
end
