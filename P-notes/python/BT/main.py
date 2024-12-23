class Node:
    def __init__(self, nid, value=None):
        self.value = value
        self.isLeft = False
        self.isRight = False
        self.right: Node
        self.left: Node
        self.id = nid.get_new_id()

    def add_value(self, value):
        self.value = value
        return

    def __repr__(self):
        return f"ID : {self.id}, VALUE : {self.value}"


class Generator_ID:
    def __init__(self):
        self.gID = 0

    def get_new_id(self):
        self.gID += 1
        # print(f"New assignement : {self.gID}")
        return self.gID


class simple_Tree:
    def __init__(self, root):
        self.root: Node = root

    def add_to_tree(self, node: Node):
        if self.root is None:
            self.root = node
            return
        if self.root.id == node.id:
            return
        else:
            self.update(self.root, node)

    def update(self, node: Node, new_node: Node):
        if node.id > new_node.id:
            if not node.isLeft:
                node.isLeft = True
                node.left = new_node
                return
            else:
                self.update(node.left, new_node)

        if node.id < new_node.id:
            if not node.isRight:
                node.isRight = True
                node.right = new_node
                return
            else:
                self.update(node.right, new_node)

        return

    def remove_from_tree(self, node: Node):
        pass

    def find_node(self, node: Node):
        pass

    def print_tree(self):
        if self.root is None:
            return
        self.step_print(self.root)

    def step_print(self, node: Node):
        if node is not None:
            print(f" {node} ")
            if node.isLeft:
                self.step_print(node.left)
            if node.isRight:
                self.step_print(node.right)


def main():
    gene = Generator_ID()
    x = Node(gene, 99)
    y = Node(gene, 100)
    nlist = []

    print("\nID Gen Test : ", x.id, y.id)

    for i in range(0, 10):
        nlist.append(Node(gene, i % 2))

    for item in nlist:
        print("Item : ", item.value, "ID : ", item.id)

    print()

    bt = simple_Tree(x)
    print(f"ROOT : {x.id}, {x.value}")

    for node in nlist:
        bt.add_to_tree(node)

    bt.print_tree()


if __name__ == '__main__':
    main()
