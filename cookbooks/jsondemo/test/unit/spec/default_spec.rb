# Encoding: utf-8
require_relative 'spec_helper'

describe 'jsondemo::default' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should do convege' do
    expect(chef_run).to be
  end

end
