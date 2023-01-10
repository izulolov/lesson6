module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  module ClassMethods
    def instances
      @instances ||= 0
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instaces += 1
    end
  end
end
