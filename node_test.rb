require 'minitest/autorun'
require 'minitest/pride'
require_relative 'node'

class NodeTest < Minitest::Test
  def test_node_can_have_no_data
    node = Node.new
    assert_equal nil, node.data
  end

  def test_node_can_have_some_data
    node = Node.new("datuh")
    assert_equal "datuh", node.data
  end

  def test_node_can_know_about_next_node
    node1 = Node.new("Node1")
    node2 = Node.new("Node2")
    assert_equal node2, node1.next(node2)
  end
end
