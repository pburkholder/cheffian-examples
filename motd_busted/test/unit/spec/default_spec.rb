# Encoding: utf-8
require_relative 'spec_helper'

describe 'motd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should create MOTD with correct content' do
    pending
  end
end
