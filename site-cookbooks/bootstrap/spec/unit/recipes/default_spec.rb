require 'spec_helper'

describe 'bootstrap::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  it 'should install and enable mongodb' do
    expect(chef_run).to enable_service 'mongodb'
    expect(chef_run).to include_recipe('mongodb::install')
  end
end
