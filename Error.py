class Error:
    def __init__(self, loc, message):
        self.loc = loc
        self.message = message
    
    def __repr__(self):
        return f"{self.message} {self.loc}"


def throw(error):
    print(error)
    exit(1)


