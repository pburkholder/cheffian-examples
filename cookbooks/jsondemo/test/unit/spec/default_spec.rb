# Encoding: utf-8
require_relative 'spec_helper'

describe 'jsondemo::default' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should do converge' do
    expect(chef_run).to be
  end

  it 'should create file with key:value' do
    expect(chef_run).to render_file('/etc/foo')
      .with_content(/regex works too.+/)
  end

end
