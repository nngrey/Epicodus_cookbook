require 'spec_helper'

describe Contributor do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :recipes }
end
