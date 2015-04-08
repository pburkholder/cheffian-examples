#
# Cookbook Name:: attribute
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'attribute::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'exhibits the merged hash' do
      expect(chef_run).to render_file('/etc/config').
        with_content('my_value:value1:value2:value3:my_value4')
    end
  end
end
