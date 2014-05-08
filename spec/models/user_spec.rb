require 'spec_helper'

describe User do
  it { should validate_presence_of :display_name }
  it { should validate_uniqueness_of :display_name }
  it { should have_valid(:display_name).when(
    "five5", "twenty_five_characters_25", "dashes-123")}
  it { should_not have_valid(:display_name).when(
    "shrt", "twenty_six_characters_26_0", "abc$123", "abc'123")}
end
