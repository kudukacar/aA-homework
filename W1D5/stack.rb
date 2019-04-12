  class Stack
    def initialize
      @store = []
    end

    def push(el)
      @store << el
    end

    def pop
     @store = @store[0...-1]
    end

    def peek
      @store[-1]
    end
  end