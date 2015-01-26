# Encoding: utf-8
require_relative 'spec_helper'

describe 'motd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should create MOTD' do
    expect(chef_run).to render_file('/etc/motd')
      .with_content('Property of Awesome Appliance')
  end
end
