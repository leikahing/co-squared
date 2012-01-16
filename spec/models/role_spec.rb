require 'spec_helper'

describe "Role Model" do
  let(:role) { Role.new }
  it 'can be created' do
    role.should_not be_nil
  end
end
