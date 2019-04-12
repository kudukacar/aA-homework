class Map

    attr_reader :store

    def initialize
        @store = Array.new(0) {Array.new(0)}
    end

    def set(key, value)
        store[0][0] = key
        store[0][1] = value
    end

    def get(key)
        @store[store.index[key]]
    end

    def delete(key)
        @store = @store.delete([key, value])
    end

end