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
