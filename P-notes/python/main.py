class LinkList:
    def __init__(self):
        self.max_size = 0
        self.tail = None
        self.head = None
        self.collection = []

    def show_nodes(self):
        print(self.collection)
        return

    def add_to_tail(self, node):
        self.max_size += 1
        self.collection.append(node)
        if self.tail is None:
            self.tail = node

    def add_to_head(self, node):
        self.max_size += 1
        self.collection.append(node)
        if self.head is None:
            self.head = node

    def remove_from_head(self, node):
        self.max_size -= 1


class Node:
    def __init__(self, value):
        self.value = value
        self.next = None
        self.past = None

    def set_next(self, node):
        self.next = node

    def set_past(self, node):
        self.past = node

    def __repr__(self):
        return self.value


def main():
    print("Starting Linked List\n")

    nlist = LinkList()

    nlist.show_nodes()

    nlist.add_to_tail(Node(5))


if __name__ == '__main__':
    main()