#lang racket

(define (max x y)
  (if (> x y)
    x
    y)
  )


(define (find_max x y z)
  (if (> (max x y) z)
    (max x y)
    z
  )
)

(define (min x y)
  (if (< x y)
    x
    y)
  )

(define (find_second_max x y z)
   (if (< (max x y) z)
     (max x y)
     (max (min x y) z)
     )
  )

(find_second_max 1 2 3)

(define (add_two_larger x y z)
  (+ (find_max x y z)
    (find_second_max x y z))
  )

(add_two_larger 1 2 3)
