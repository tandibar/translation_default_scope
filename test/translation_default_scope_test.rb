require 'test_helper'

class TranslationDefaultScopeTest < ActiveSupport::TestCase
  include ActionView::Helpers::TranslationHelper

  test "should set default scope for translate without scope" do
    self.default_scope = [:frontend, :sections, :testing]
    self.expects(:translate_without_default_scope).with(:foo, :scope => [:frontend, :sections, :testing])
    translate(:foo)
  end

  test "should append scope after setting default scope" do
    self.default_scope = [:frontend, :sections, :testing]
    self.expects(:translate_without_default_scope).with(:foo, :scope => [:frontend, :sections, :testing, :bar])
    translate(:foo, :scope => [:bar])
  end
  
  test "should pass all options to translate" do
    self.expects(:translate_without_default_scope).with(:foo, :default => "bar")
    translate(:foo, :default => "bar")
  end
  
end