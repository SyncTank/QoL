
class Node:
    def __init__(self, value):
        self.value = value
        self.next = None
        self.past = None

    def set_value(self, value):
        self.value = value

    def set_next(self, node):
        self.next = node

    def set_past(self, node):
        self.past = node

    def __repr__(self):
        return str(self.value)


class LinkList:
    def __init__(self):
        self.max_size: int = 0
        self.tail = None
        self.head = None
        self.collection: list = []  # Only for debugging

    def show_nodes(self):
        print(self.collection)
        return

    def add_to_tail(self, node: Node):
        if node.value is None:
            raise ValueError("None tried to add nothing to list")
        self.max_size += 1
        self.collection.append(node)
        if self.tail is None:
            self.tail = node
        else:
            self.tail.set_next(node)
            node.set_past(self.tail)
            self.tail = node
        if self.head is None:
            self.head = node

    def add_to_head(self, node):
        if node.value is None:
            raise ValueError("None tried to add nothing to list")
        self.max_size += 1
        self.collection.insert(0, node)
        if self.head is None:
            self.head = node
        else:
            self.head.set_past(node)
            node.set_next(self.head)
            self.head = node
        if self.tail is None:
            self.tail = node

    def remove_from_head(self):
        if self.max_size == 0:
            return -1
        if self.head is None:
            return -1
        if self.max_size == 1:
            self.max_size -= 1
            self.collection.pop(0)
            self.head = None
        else:
            self.head = self.head.next
            self.max_size -= 1
            self.collection.pop(0)

    def remove_from_tail(self):
        if self.max_size == 0:
            return -1
        if self.tail is None:
            return -1
        if self.max_size == 1:
            self.max_size -= 1
            self.collection.pop(-1)
            self.tail = None
        else:
            self.tail = self.tail.past
            self.max_size -= 1
            self.collection.pop(-1)


def main():
    print("Starting Linked List\n")

    nlist = LinkList()

    # nlist.add_to_head(Node(None))

    nlist.show_nodes()
    nlist.remove_from_head()
    nlist.remove_from_head()

    nlist.add_to_tail(Node(5))
    nlist.add_to_tail(Node(6))
    nlist.add_to_head(Node(1))

    nlist.show_nodes()

    print(f"Max Size {nlist.max_size} \nNext To Head {
          nlist.head} -> {nlist.head.next} Past To Tail {nlist.tail} -> {nlist.tail.past}\n")

    nlist.show_nodes()

    nlist.remove_from_tail()

    nlist.show_nodes()

    nlist.remove_from_head()

    nlist.show_nodes()

    nlist.remove_from_head()

    nlist.show_nodes()

    nlist.add_to_tail(Node(0))
    nlist.add_to_head(Node(8))
    nlist.show_nodes()

    print(f"Max Size {nlist.max_size} \nNext To Head {
          nlist.head} -> {nlist.head.next} Past To Tail {nlist.tail} -> {nlist.tail.past}\n")

    nlist.remove_from_head()
    nlist.add_to_tail(Node(12))
    nlist.show_nodes()

    print(f"Max Size {nlist.max_size} \nNext To Head {
          nlist.head} -> {nlist.head.next} Past To Tail {nlist.tail} -> {nlist.tail.past}\n")

    nlist.remove_from_head()

    nlist.show_nodes()

    nlist.remove_from_tail()
    nlist.add_to_tail(Node(11))

    nlist.show_nodes()

    print(f"Max Size {nlist.max_size} \nNext To Head {
          nlist.head} -> {nlist.head.next} Past To Tail {nlist.tail} -> {nlist.tail.past}\n")


if __name__ == '__main__':
    main()
