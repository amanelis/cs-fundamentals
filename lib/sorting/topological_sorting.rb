require 'rubygems'
require 'tsort'

class JobRunner
  include TSort
  
  Job = Struct.new(:name, :dependencies)
  def initialize 
    @jobs = Hash.new{|h,k| h[k] = []}
  end
  
  alias_method :execute, :tsort
  
  def add name, dependencies=[]
    @jobs[name] = dependencies
  end
  
  def tsort_each_node &block
    @jobs.each_key(&block)
  end
  
  def tsort_each_child node, &block
    @jobs[node].each(&block)
  end
end

runner = JobRunner.new
runner.add('breakfast', ['serve'])
runner.add('serve', ['cook'])
runner.add('cook', ['buy eggs','buy bacon'])
puts runner.execute

