require 'spec_helper'

describe Nature do

  it { should belong_to :decreased_stat }
  it { should belong_to :increased_stat }

end
