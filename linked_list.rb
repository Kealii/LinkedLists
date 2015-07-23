require_relative 'node'

class LinkedList
  attr_accessor :head

  def append(new_node)
    @head == nil ? @head = new_node : tail.next = new_node
  end

  def prepend(new_node)
    insert(new_node)
  end

  def insert(new_node, position = 0)
    current_node = @head
    previous_node = @head
    if position == 0
      new_node.next = @head
      @head = new_node
    else
      position.times do
        current_node = current_node.next
      end
      new_node.next = current_node
      (position - 1).times do
        previous_node = previous_node.next
      end
        previous_node.next = new_node
    end
  end

  def includes?(target_data)
    current_node = @head
    if @head == nil
      false
    elsif @head.next == nil
      @head.data == target_data ? true : false
    else
      current_node = current_node.next until current_node.next == nil || current_node.data == target_data
      current_node.data == target_data ? true : false
    end
  end

  def pop
    if @head == nil
      popped_node = nil
    elsif @head.next == nil
      popped_node = @head
      @head = nil
    else
      current_node = @head
      current_node = current_node.next until current_node.next.next == nil
      popped_node = current_node.next
      current_node.next = nil
    end
    popped_node
  end

  def count
    counter = 0
    current_node = @head
    if @head == nil
    elsif @head.next == nil
      counter = 1
    else
      counter = 1
      until current_node.next == nil do
        current_node = current_node.next
        counter += 1
      end
    end
    counter
  end

  def tail
    current_node = @head
    current_node = current_node.next while current_node != nil && current_node.next != nil
    current_node
  end

  def find_by_index(index = 0)
    current_node = @head
    if index == 0
    else
      (index-1).times do
        current_node = current_node.next
      end
      value = current_node.data
    end
  end

  def find_by_value(value)
    index = 1
    current_node = @head
    if includes?(value)
      while current_node.data != value do
        current_node = current_node.next
        index += 1
      end
      index
    end
  end

  def remove_by_index(index = 0)
    current_node = @head
    previous_node = @head
    if index == 0
    elsif index == 1
      replacement = current_node.next
      current_node.next = nil
      @head = replacement
    else
      (index-2).times do
        current_node = current_node.next
      end
      replacement = current_node.next.next
      current_node.next.next = nil
      current_node.next = replacement
    end
  end

  def remove_by_value(value)
    previous_node = @head
    position = 0
    current_node = @head
    if current_node == nil
    else
      until current_node.data == value || current_node.next == nil
        current_node = current_node.next
        position += 1
        if current_node.data == value
          (position - 1).times do
            previous_node = previous_node.next
            previous_node.next = current_node.next.next
            current_node.next = nil
          end
        end
      end
    end
  end
end
