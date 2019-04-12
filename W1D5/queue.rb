class Queue
    attr_reader :line
    
    def initialize
        @line = []
    end

    def enqueue(el)
        @line.push(el)
    end

    def dequeue
        @line.shift
    end

    def peek
        @line[0]
    end
end