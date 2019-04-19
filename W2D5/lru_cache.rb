class LRUCache
    attr_reader :cache

    def initialize(size)
        @cache = Array.new(size)
    end

    def count
      cache.count
    end

    def add(el)
       array.shift if cache.length == 4
        cache.push(el)
    end

    def show
      cache
    end

    private
    # helper methods go here!

  end