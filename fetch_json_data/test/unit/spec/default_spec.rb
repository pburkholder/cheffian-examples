# Encoding: utf-8
require_relative 'spec_helper'

describe 'fetch_json_data::default' do
  context 'when using defaults' do
    let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'should do converge' do
      expect(chef_run).to be
    end

    it 'should create file with key:value' do
      expect(chef_run).to render_file('/etc/foo')
        .with_content('what:app')
    end
  end

  context 'when setting webserver duty' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['duty'] = 'webserver'
      end.converge(described_recipe)
    end

    it 'should create file with what:web' do
      expect(chef_run).to render_file('/etc/foo')
        .with_content('what:web')
    end
  end
end
