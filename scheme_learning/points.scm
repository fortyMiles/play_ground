(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (average x y) (/ (+ x y) 2.0))
(define (mid-point p1 p2)
  (make-point (average (x-point p1) (x-point p2))
	      (average (y-point p1) (y-point p2))
	      ))

(define (display-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline)
  )


(define (make-segment p1 p2)
  (cons p1 p2)
  )

(define (start-segment line)
  (car line)
  )

(define (end-segment line)
  (cdr line)
  )

(define (mid-segment line)
  (mid-point (start-segment line) (end-segment line))
  )







  
