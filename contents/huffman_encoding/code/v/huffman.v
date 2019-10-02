struct Node {
mut:
    freq  int
    char  rune
    left  &Node
    right &Node
}

struct Heap {
mut:
    data     []&Node
    length   int
    capacity int
}

fn is_leaf(n &Node) bool {
    return !isnil(n.left) && !isnil(n.right)
}

fn swap(left mut &Node, right mut &Node) {
    tmp := &Node(*left)
    *left = *right
    *right = tmp
}

fn heap_push(h mut Heap, n Node) {
    if h.capacity == h.length {
        if h.capacity > 0 {
            h.capacity = h.capacity * 2
        } else {
            h.capacity = 4
        }

        mut new_data := [Node{}].repeat(h.capacity)
        for i, p in h.data {
            new_data[i] = p
        }
        h.data = new_data
    }

    h.data[h.length] = n
    h.length++

    mut idx := h.length - 1

    for idx > 0 {
        parent_idx := (idx - 1) / 2
        if h.data[parent_idx].freq <= h.data[idx].freq {
            break
        }

        swap(mut h.data[parent_idx], mut h.data[idx])
        idx = parent_idx
    }
}

fn main() {
    println("Works!")
}