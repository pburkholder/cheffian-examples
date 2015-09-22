#
# Cookbook Name:: chefspec_encrypted_db
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chefspec_encrypted_db::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
      allow(Chef::EncryptedDataBagItem).to receive(:load)
        .with('simple', 'edb', 'secret').and_return('simple_edb')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'makes /etc/cleartext' do
      expect(chef_run).to render_file('/etc/cleartext').
        with_content('Welcome to secret: cleartext')
    end

    it 'makes /etc/simple_edb' do
      expect(chef_run).to render_file('/etc/simple_edb').
        with_content('Welcome to secret: simple_edb')
    end
  end
end
