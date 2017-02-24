class Node
  attr_accessor :value, :next_node
  def initialize value, next_node=nil
  @value = value
  @next_node = next_node
  end  
  def inspect
  print "(#{value}) -> "
  print " nil" if @next_node.nil?
  end
  end  

class LinkedList
  attr_accessor :head, :tail
  def to_s 
    if @head.nil?
    "empty list!"
    else 
    item = @head 
    while item.next_node
    item.inspect
    item = item.next_node
    end
    end
    @tail.inspect
    puts"\n"
    end    
  
  def append v
      if @head.nil? 
      @head = Node.new(v)
      @tail = @head
      else
      @tail.next_node = Node.new(v) 
      @tail = @tail.next_node
      end
      end  
    
  def prepend v
    if @head.nil?
    self.append(v)
    else
    @head = Node.new(v,@head)
    end  
    end  
    
  def size 
    count = 0   
   if @head.nil?
   count
   else 
    item = @head 
    while item.next_node
    count += 1
    item = item.next_node
    end
    count += 1 
    end   
    count
    end
    
  def at index 
    return @head if index == 0   
    item = @head
    count = 0 
      while item.next_node
      count += 1
      return item.next_node if index == count
      item = item.next_node
      end
    puts "Item not found!"  
    end  
    
  def find data 
    return if @head.nil?
    item = @head
    count = 0 
      while item.next_node
      return count if data == item.value
      count += 1
      item = item.next_node
      end
    return count if data == item.value
    end  
    
  def pop
    if @tail == @head
      @tail = nil
      @head = nil
      return
      
    end  
    @tail = at(size-2)
    @tail.next_node = nil
    end
    
  def contains? value 
    find(value) ? true : false
    end  
    
  def insert_at index,data 
    if index == 0 
    prepend data
    else 
    at(index-1).next_node = Node.new(data,at(index))
    end
    end  
    
  def remove_at index
    if at(index) == @tail 
    pop 
    elsif  at(index) == @head 
    @head = @head.next_node
    else  
    at(index-1).next_node = at(index).next_node
    end
    end
end  

list =LinkedList.new



list.append 1
list.append 2
list.append 6
list.append 2
list.append 8
list.append 98
list.prepend 0 
list.append 12

list.to_s 
list.pop
list.to_s
list.append 5
list.to_s
list.contains? 55
list.insert_at 2,999
list.to_s
list.insert_at 1,111
list.to_s
list.insert_at 0,666
list.to_s
list.remove_at 2
list.to_s
list.at 9
list.remove_at 0 
list.to_s
list.remove_at 0 
list.remove_at 0 
list.to_s
