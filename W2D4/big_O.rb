def sluggish_O(array)
    longest_fish = array[0]
    (0...array.length - 1).each do |i|
        (i + 1...array.length).each do |j|
           longest_fish = array[i] if array[i].length > array[j].length 
           longest_fish = array[j] if array[j].length > array[i].length
        end
    end
    longest_fish
end

def merge_sort(array)
    return array if array.length <= 1
    mid_idx = array.length/2
    left = merge_sort(array[0...mid_idx])
    right = merge_sort(array[mid_idx..-1])
    merge(left, right)
    array[-1]
end
def merge(arr_1, arr_2)
    array = []
    if arr_1[0] < arr_2[0]
        array << arr_1.shift
    else
        array << arr_2.shift
    end
    array + arr_1 + arr_2
end