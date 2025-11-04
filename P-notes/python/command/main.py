from abc import abstractmethod


class Command:
    def __init__(self):
        pass

    @abstractmethod
    def execute(self, actor):
        pass


class Jump(Command):
    def __init__(self):
        super().__init__()

    def execute(self, actor):
        print(f"Jump {actor.value}")


class Swap(Command):
    def __init__(self):
        super().__init__()

    def execute(self, actor):
        print("Swap")


class InputHanlder:
    def __init__(self):
        self.jump = Command()
        self.swap = Command()
        self.inputs = ['k', 'c', 'i', 'b']


class Rando:
    def __init__(self):
        self.value = "Ye"


def main():
    inp = InputHanlder()
    ran = Rando()
    inp.jump.execute(ran)


if __name__ == "__main__":
    main()
