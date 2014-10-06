# Encoding: utf-8
require_relative 'spec_helper'

describe 'partial_templates::default' do
    let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'should do converge' do
      expect(chef_run).to be
    end

    it 'should create file with global section' do
      expect(chef_run).to render_file('/etc/foo')
        .with_content('global_content')
    end

    it 'should create file with local1 section' do
      expect(chef_run).to render_file('/etc/foo')
        .with_content('local static content')
    end

    it 'should create file with local2 dynamic section' do
      expect(chef_run).to render_file('/etc/foo')
        .with_content('local variable content')
    end

    it 'should creat file with variable dynamic section' do
      expect(chef_run).to render_file('/etc/foo')
        .with_content('[appserver_only]')
    end
end
