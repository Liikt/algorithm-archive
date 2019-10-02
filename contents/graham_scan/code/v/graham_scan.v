import math

struct point {
    x f64
    y f64
}

fn counter_clockwise(p1, p2, p3 point) bool {
    return (p3.y-p1.y)*(p2.x-p1.x) >= (p2.y-p1.y)*(p3.x-p1.x)
}

fn polar_angle(ref, p point) f64 {
    return math.atan2(p.y-ref.y, p.x-ref.x)
}

