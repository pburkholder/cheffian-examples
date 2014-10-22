# Encoding: utf-8
require_relative 'spec_helper'

describe 'lazy_eval::default' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should do converge' do
    expect(chef_run).to be
  end

  it 'should create /etc/before' do
    expect(chef_run).to render_file('/etc/before')
      #.with_content(/Before/)
  end
  it 'should create /etc/after' do
    expect(chef_run).to render_file('/etc/after')
      #.with_content(/After/)
  end
end
