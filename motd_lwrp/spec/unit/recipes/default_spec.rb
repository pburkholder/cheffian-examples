#
# Cookbook Name:: motd
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'motd_test::default' do
  context 'when steps into motd_motd' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
         step_into: ['motd_motd']   # This is what was needed
      ).converge(described_recipe)
    end

    it 'should converge' do
      expect(chef_run).to be
    end

    it 'motd includes name' do
      expect(chef_run).to create_file('/etc/motd').
        with_content(/Welcome to BCUS/)
    end

    it 'should create motd' do
      expect(chef_run).to create_motd(/Welcome/)
    end
  end
end
