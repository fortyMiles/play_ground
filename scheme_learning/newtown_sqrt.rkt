#lang racket

"define of abs"
(define (abs x)
  (if (< x 0)
    (* -1 x)
    x
    )
  )

"define sqrt"
(define (sqrt x)
  (* x x)
  )

"define MIN"
(define MIN 0.0001)

"define of good_enough?"
(define (good_enough? guess x)
  (< (abs (- (sqrt guess) x)) MIN)
  )

"define of improve"
(define (imporove guess x)
  (average guess (/ x guess))
  )


