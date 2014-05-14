require 'spec_helper'

describe DaycarePokemon do

  it { should validate_presence_of :nickname }
  it { should validate_presence_of :hp_iv }
  it { should validate_presence_of :atk_iv }
  it { should validate_presence_of :def_iv }
  it { should validate_presence_of :spa_iv }
  it { should validate_presence_of :spd_iv }
  it { should validate_presence_of :spe_iv }
  it { should belong_to :pokemon }
  it { should belong_to :ability }
  it { should belong_to :nature }
  it { should belong_to :moveset }
  it { should belong_to :gender }

end
