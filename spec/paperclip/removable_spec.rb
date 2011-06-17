require 'spec_helper'

describe Paperclip::Removable do

  it 'should create accessors' do
    User.new.should respond_to(:remove_photo)
    User.new.should respond_to(:remove_photo=)
    User.new.remove_photo.should be(false)
  end

  it 'should allow to remove attachemnts' do
    record = User.new
    record.photo = StringIO.new("")
    record.photo.should be_file
    record.remove_photo = '1'
    record.photo.should_not be_file
  end

end
