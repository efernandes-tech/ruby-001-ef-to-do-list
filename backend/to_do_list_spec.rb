require 'rspec'
require_relative 'to_do_list'

RSpec.describe ToDoList do
  let(:to_do_list) { ToDoList.new('test_tasks.json') }

  after(:each) do
    File.delete('test_tasks.json') if File.exist?('test_tasks.json')
  end

  it 'starts with no tasks' do
    expect(to_do_list.tasks.length).to eq(0)
  end

  it 'adds tasks successfully' do
    to_do_list.add_task('Learn Ruby')
    expect(to_do_list.tasks.length).to eq(1)
    expect(to_do_list.tasks.first[:description]).to eq('Learn Ruby')
  end

  it 'marks tasks as completed' do
    to_do_list.add_task('Test')
    to_do_list.complete_task(1)
    expect(to_do_list.tasks.first[:completed]).to be true
  end

  it 'persists tasks to file' do
    to_do_list.add_task('Persistence test')
    new_list = ToDoList.new('test_tasks.json')
    expect(new_list.tasks.length).to eq(1)
  end
end
