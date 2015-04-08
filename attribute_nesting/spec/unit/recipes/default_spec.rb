#
# Cookbook Name:: attribute
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'attribute_nesting::default' do

  context 'When using this wrapper cookbook' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'has the modifled attributes: my_value:value1:value2:value3:my_value4' do
      expect(chef_run).to render_file('/etc/config').
        with_content('my_value:value1:value2:value3:my_value4')
    end
  end
end
describe 'blah::default' do

  context 'When using the blah cookbook' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'has the unmodified hash: value:value1:value2:value3' do
      expect(chef_run).to render_file('/etc/blah').
        with_content('value:value1:value2:value3')
    end
  end
end
