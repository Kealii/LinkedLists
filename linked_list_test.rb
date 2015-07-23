require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_list'

class LinkedListTest < Minitest::Test
  def test_head_is_nil_at_start
    list = LinkedList.new
    assert_equal nil, list.head
  end

  def test_append_to_a_empty_list_sets_the_node_as_the_head
    list = LinkedList.new
    node = Node.new("Data")
    list.append(node)
    assert_equal node, list.head
  end

  def test_append_to_list_with_1_node_sets_next_of_head
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    list.append(node1)
    list.append(node2)
    assert_equal node2, list.head.next
  end

  def test_append_to_list_with_2_nodes_sets_the_third
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    node3 = Node.new("so")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal node3, list.head.next.next
  end

  def test_append_to_list_with_3_nodes_sets_the_fourth
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    node3 = Node.new("so")
    node4 = Node.new("amaze")

    list.append(node1)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    assert_equal node4, list.head.next.next.next
  end

  def test_prepend_to_a_empty_list_sets_the_node_as_the_head
    list = LinkedList.new
    node = Node.new("Data")
    list.prepend(node)
    assert_equal node, list.head
  end

  def test_prepend_to_a_list_of_1_sets_the_node_as_the_head
    list = LinkedList.new
    node1 = Node.new("Data")
    node2 = Node.new("Bank")
    list.append(node1)
    list.prepend(node2)
    assert_equal node2, list.head
  end

  def test_prepend_to_a_list_of_3_sets_the_node_as_the_head
    list = LinkedList.new
    node1 = Node.new("Data")
    node2 = Node.new("Bank")
    node3 = Node.new("We")
    node4 = Node.new("Gonna")
    list.append(node1)
    list.prepend(node2)
    list.append(node3)
    assert_equal node2, list.head
    assert_equal node1, list.head.next
    list.prepend(node4)
    assert_equal node4, list.head
    assert_equal node2, node4.next
  end

  def test_insert_node_to_empty_list_sets_node_as_head
    list = LinkedList.new
    node = Node.new("Data")
    list.insert(node)
    assert_equal node, list.head
  end

  def test_insert_node_to_0_position_with_one_item_sets_node_as_head
    list = LinkedList.new
    node1 = Node.new("Data")
    node2 = Node.new("")
    list.append(node1)
    list.insert(node2)
    assert_equal node2, list.head
    assert_equal node1, node2.next
  end

  def test_insert_node_to_1_position_with_2_items_leaves_node_as_head
    list = LinkedList.new
    node1 = Node.new("Data")
    node2 = Node.new("")
    node3 = Node.new("Bank")
    list.append(node1)
    list.prepend(node2)
    list.insert(node3, 1)
    assert_equal node2, list.head
    assert_equal node3, list.head.next
    assert_equal node1, node3.next
  end

  def test_includes_returns_false_if_list_is_empty
    list = LinkedList.new
    refute list.includes?("sowow")
  end

  def test_includes_returns_false_if_list_has_incorrect_match
    list = LinkedList.new
    node1 = Node.new("ohai")
    node2 = Node.new("has")
    node3 = Node.new("cheeseburger?")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    refute list.includes?("can")
  end

  def test_includes_returns_true_if_list_has_correct_match
    list = LinkedList.new
    node = Node.new("sowow")
    list.append(node)
    assert list.includes?("sowow")
  end

  def test_includes_returns_true_if_list_has_correct_match_later
    list = LinkedList.new
    node1 = Node.new("sowow")
    node2 = Node.new("amaze")
    node3 = Node.new("car")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert list.includes?("amaze")
  end

  def test_pop_on_empty_list_returns_nil
    list = LinkedList.new
    assert_equal nil, list.pop
  end

  def test_pop_on_list_of_one_returns_node
    list = LinkedList.new
    node = Node.new("yaaaay")
    list.append(node)
    assert_equal node, list.pop
    assert_equal nil, list.head
  end

  def test_pop_on_list_of_two_returns_last_node
    list = LinkedList.new
    node1 = Node.new("yaaaay")
    node2 = Node.new("lockin")
    list.append(node1)
    list.append(node2)
    assert_equal node2, list.pop
    assert_equal node1, list.head
    assert_equal nil, list.head.next
  end

  def test_pop_on_list_of_five_returns_last_node
    list = LinkedList.new
    node1 = Node.new("pop")
    node2 = Node.new("lock")
    node3 = Node.new("and")
    node4 = Node.new("drop")
    node5 = Node.new("it")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    list.append(node5)
    assert_equal node5, list.pop
    assert_equal nil, node4.next
  end

  def test_count_empty_list_returns_0
    list = LinkedList.new
    assert_equal 0, list.count
  end

  def test_count_list_of_1_returns_1
    list = LinkedList.new
    node = Node.new('oof')
    list.append(node)
    assert_equal 1, list.count
  end

  def test_count_list_of_2_returns_2
    list = LinkedList.new
    node1 = Node.new('oof')
    node2 = Node.new('oof')
    list.append(node1)
    list.append(node2)
    assert_equal 2, list.count
  end

  def test_count_list_of_5_returns_5
    list = LinkedList.new
    node1 = Node.new('dum')
    node2 = Node.new('ksh')
    node3 = Node.new('ba')
    node4 = Node.new('jah')
    node5 = Node.new('rasta')
    list.append(node1)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    list.append(node5)
    assert_equal 5, list.count
  end

  def test_tail_with_empty_list_returns_nil
    list = LinkedList.new
    assert_equal nil, list.tail
  end

  def test_tail_with_1_node_returns_the_node
    list = LinkedList.new
    node = Node.new("such")
    list.append(node)
    assert_equal node, list.tail
  end

  def test_tail_with_2_nodes_returns_the_last_node
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    list.append(node1)
    list.append(node2)
    assert_equal node2, list.tail
  end

  def test_tail_with_3_nodes_returns_the_last_node
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    node3 = Node.new("so")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal node3, list.tail
  end

  def test_find_by_index_of_empty_list_returns_nil
    list = LinkedList.new
    assert_equal nil, list.find_by_index
  end

  def test_find_by_index_of_one_node_list_returns_data_of_node
    list = LinkedList.new
    node = Node.new("Jah")
    list.append(node)
    assert_equal node, list.head
    assert_equal "Jah", list.find_by_index(1)
  end

  def test_find_by_index_of_three_node_list_returns_data_of_node
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    node3 = Node.new("so")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal "wow", list.find_by_index(2)
  end

  def test_find_by_value_returns_nil_if_list_is_empty
    list = LinkedList.new
    assert_equal nil, list.find_by_value("yuss")
  end

  def test_find_by_value_returns_nil_if_no_node_has_desired_data
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    node3 = Node.new("so")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal nil, list.find_by_value("amaze")
  end

  def test_find_by_value_returns_1_if_head_contains_desired_data
    list = LinkedList.new
    node = Node.new("yuss")
    list.append(node)
    assert_equal 1, list.find_by_value("yuss")
  end

  def test_find_by_value_returns_2_if_second_node_contains_desired_data
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    list.append(node1)
    list.append(node2)
    assert_equal 2, list.find_by_value("wow")
  end

  def test_find_by_value_returns_2_if_middle_node_contains_desired_data
    list = LinkedList.new
    node1 = Node.new("such")
    node2 = Node.new("wow")
    node3 = Node.new("doge")
    list.append(node1)
    list.append(node2)
    list.append(node3)
    assert_equal 2, list.find_by_value("wow")
  end

  def test_remove_by_index_on_empty_list_returns_nil
    list = LinkedList.new
    assert_equal nil, list.remove_by_index
  end

  def test_remove_by_index_on_list_of_one_removes_head
    list = LinkedList.new
    node = Node.new("blech")
    list.append(node)
    list.remove_by_index(1)
    assert_equal nil, list.head
  end

  def test_removing_the_head_makes_new_head
    list = LinkedList.new
    node1 = Node.new("blech")
    node2 = Node.new('achoo')
    list.append(node1)
    list.append(node2)
    list.remove_by_index(1)
    assert_equal node2, list.head
    assert_equal nil, node2.next
  end

  def test_removing_the_2nd_node_attaches_3rd_to_1st
    list = LinkedList.new
    node1 = Node.new("blech")
    node2 = Node.new('achoo')
    node3 = Node.new('bless')
    list.append(node1)
    list.append(node2)
    list.append(node3)
    list.remove_by_index(2)
    assert_equal node1, list.head
    assert_equal node3, list.head.next
  end

  def test_remove_by_value_on_empty_list_returns_nil
    list = LinkedList.new
    assert_equal nil, list.remove_by_value("subabru")
  end

  def test_remove_by_value_with_no_match_returns_nil
    list = LinkedList.new
    node = ("dnb")
    list.append(node)
    assert_equal nil, list.remove_by_value("house")
  end

  def test_remove_by_value_with_1_item_list_removes_head
    list = LinkedList.new
    node = ("dnb")
    list.append(node)
    list.remove_by_value("dnb")
    assert_equal nil, list.head
  end
end
