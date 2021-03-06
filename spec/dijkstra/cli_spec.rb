require 'spec_helper'

describe Dijkstra::Cli do
  def spec_file(file)
    File.expand_path("../../files/#{file}",__FILE__)
  end
  
  it 'prints usage if args is less then 3' do
    cli = Dijkstra::Cli.new()
    
    expect(cli).to receive :usage
    
    cli.run
  end
  
  context 'parse' do
    it 'returns an array of weighted edges' do
      items = Dijkstra::Cli.new(spec_file('simple.txt'),'A','B').parse
      
      expect(items).to be_an Array
      expect(items[0]).to eq ['A','B','1',1]
    end
  end
end