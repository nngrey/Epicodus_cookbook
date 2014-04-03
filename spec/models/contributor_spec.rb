require 'spec_helper'

describe Contributor do
  it { should validate_presence_of :name }
end
