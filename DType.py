class DType:
    def __init__(self, name, size, members=None):
        self.name=name
        self.size=size
        self.members=members
    
    def __eq__(self, other):
        return self.name == other.name

    def __repr__(self):
        return f"[ Type: {self.name} ]"