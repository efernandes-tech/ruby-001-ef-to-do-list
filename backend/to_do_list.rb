class ToDoList
  def initialize
    @tasks = []
  end

  def add_task(description)
    task = {
      id: @tasks.length + 1,
      description: description,
      completed: false
    }
    @tasks << task
    puts "Task added: #{description}"
  end

  def list_tasks
    if @tasks.empty?
      puts "No tasks yet. Add one to get started!"
      return
    end

    puts "\n--- Your Tasks ---"
    @tasks.each do |task|
      status = task[:completed] ? "[x]" : "[ ]"
      puts "#{task[:id]}. #{status} #{task[:description]}"
    end
  end

  def complete_task(id)
    task = @tasks.find { |t| t[:id] == id }
    if task
      task[:completed] = true
      puts "Completed: #{task[:description]}"
    else
      puts "Task not found!"
    end
  end

  def delete_task(id)
    task = @tasks.find { |t| t[:id] == id }
    if task
      @tasks.delete(task)
      puts "Deleted: #{task[:description]}"
    else
      puts "Task not found!"
    end
  end
end

def show_menu
  puts "\n=== Ruby To Do List ==="
  puts "1. Add task"
  puts "2. List tasks"
  puts "3. Complete task"
  puts "4. Delete task"
  puts "5. Exit"
  print "\nChoose an option: "
end

todo_list = ToDoList.new

loop do
  show_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Task description: "
    description = gets.chomp
    todo_list.add_task(description)
  when 2
    todo_list.list_tasks
  when 3
    print "Task ID to complete: "
    id = gets.chomp.to_i
    todo_list.complete_task(id)
  when 4
    print "Task ID to delete: "
    id = gets.chomp.to_i
    todo_list.delete_task(id)
  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid option!"
  end
end
