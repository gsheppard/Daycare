require 'spec_helper'

describe User do
  it { should validate_presence_of :display_name }
  it { should validate_uniqueness_of :display_name }
end
