class Queue:
    def __init__(self, max_size):
        self.max_size = max_size
        self.items = []

    def resize(self, size):
        self.max_size = size
        return

    def size(self):
        return len(self.items)

    def is_empty(self):
        if len(self.items) == 0:
            return False
        else:
            return True

    def show_queue(self):
        print(self.items)
        return

    def enqueue(self, item):
        if self.size() < self.max_size:
            self.items.append(item)
            return
        else:
            raise Exception("Over buffer size")

    def dequeue(self):
        if not self.is_empty():
            return self.items.pop(0)
        else:
            raise IndexError("Queue is empty can't pop")

    def peek(self):
        if not self.is_empty():
            return self.items[-1]
        else:
            raise IndexError("Queue is empty can't pop")


def main():
    q = Queue(5)
    q.show_queue()
    q.enqueue("We")
    q.enqueue("party")
    q.enqueue("all")
    q.enqueue("night!")

    q.show_queue()


if __name__ == '__main__':
    main()
