module TranslationDefaultScope
  
  module InstanceMethods
    
    attr_accessor :default_scope
    
    def translate_with_default_scope(key, options = {})
      options[:scope] = default_scope + (options[:scope] || []) if default_scope
      translate_without_default_scope(key, options)
    end
    
  end
  
  def self.included(receiver)
    receiver.send :include, InstanceMethods
    receiver.alias_method_chain :translate, :default_scope
  end
  
end