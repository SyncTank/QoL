
class Node: # Parent node
    def __init__(self):
        self.children = []

    def add_child(self, node):
        self.children.append(node)

    def run(self) -> bool:
        raise NotImplementedError("Meant to be overriden")

class ActionNode(Node): # Leaf node
    def __init__(self, action):
        super().__init__()
        self.action = action

    def run(self):
        return self.action()

class SelectorNode(Node): # internal node that tries its children until succession. True child pass up
     def run(self):
        for child in self.children:
            if child.run():
                return True
        return False

class SequenceNode(Node): # internal node that tries it childern until failure. On fail returns up.
    def run(self):
        for child in self.children:
            if not child.run():
                return False
        return True

def action1() -> bool:
    print("action1")
    return False

def action2() -> bool:
    print("action2")
    return False

def main() -> None:
    print("Hello")

    # root node has list of sequences it can run
    # sequence has a list of actions it can run
    # actions are bool functions that run logic

    root = SelectorNode()
    sequence = SequenceNode()
    root.add_child(sequence)
    sequence.add_child(ActionNode(action1))
    sequence.add_child(ActionNode(action2))
    root.run()

main()
