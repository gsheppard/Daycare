require 'spec_helper'

describe DaycarePokemon do

  it { should validate_presence_of :nickname }
  it { should validate_presence_of :hp_iv }
  it { should validate_presence_of :atk_iv }
  it { should validate_presence_of :def_iv }
  it { should validate_presence_of :spa_iv }
  it { should validate_presence_of :spd_iv }
  it { should validate_presence_of :spe_iv }

  it { should belong_to :user }

  it { should belong_to :pokemon }
  it { should belong_to :ability }
  it { should belong_to :nature }

  it { should have_valid(:gender).when(0,1,2) }
  it { should_not have_valid(:gender).when(-1,-2,0.5,1.5,2.5,3,4,5,nil,'string') }

end
