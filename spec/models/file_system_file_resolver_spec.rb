require 'spec_helper'

describe Riiif::FileSystemFileResolver do
  subject { Riiif::FileSystemFileResolver.new }
  it "should raise an error when the file isn't found" do
    expect{subject.find('1234')}.to raise_error Riiif::ImageNotFoundError
  end

  it "should get the jpeg2000 file" do
    expect(subject.find('world').path).to eq subject.root + '/spec/samples/world.jp2'
  end

  it "should accept ids with dashes" do
    subject.pattern('foo-bar-baz')
  end
  it "should accept ids with colins" do
    subject.pattern('fo:baz')
  end
end
