require 'spec_helper'

describe "Blog Model" do
  let(:blog) { Blog.new }
  it 'can be created' do
    blog.should_not be_nil
  end
end
