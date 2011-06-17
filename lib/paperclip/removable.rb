require 'paperclip'
require 'open-uri'

=begin
Allows removal of previously uploaded files. Example:

In the model, you can specify:

  class User < ActiveRecord::Base
    has_attached_file :photo, :removable => true
    attr_accessible   :photo, :remove_photo
  end

In the form you can then have:

  = f.inputs do
    = f.input :photo
    = f.input :remove_photo, :as => :boolean if f.object.photo?

=end
module Paperclip::Removable

  def has_attached_file_with_removable(name, options = {})
    has_attached_file_without_removable(name, options)

    if attachment_definitions[name][:removable]
      define_method(:"remove_#{name}") do
        false
      end

      define_method(:"remove_#{name}=") do |value|
        value = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value)
        send(name).clear if value
        value
      end
    end
  end

end

module Paperclip::ClassMethods # :nodoc:
  include Paperclip::Removable

  alias_method :has_attached_file_without_removable, :has_attached_file
  alias_method :has_attached_file, :has_attached_file_with_removable
end
