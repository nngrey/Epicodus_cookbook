require 'spec_helper'

describe Recipe do
  it { should validate_presence_of :name }
  it { should validate_presence_of :contents }
  it { should belong_to :contributor }
end
