(define (average a b)
  (/ (+ a b) 2.0)
  )

(define (average-damp f)
  (lambda (x) (average x (f x)))
  )

(define (double f)
  (lambda (x) (f (f x)))
  )

(define (compose f g)
  (lambda (x) (f (g x)))
  )

(define (repeat f n)
  ; to learn do things recursively.
  (lambda (x)
    (if (= n 1)
	(f x)
	((compose f (repeat f (- n 1))) x)
	)
    )
  )


(define (smooth f)
  (define dt 0.001)
  (define (average x y) (/ (+ x y) 2.0))
  (lambda (x) (average (f x) (f (+ x dt))))
  )

(define (smooth-n f n)
  (lambda (x)
    (if (= n 1)
	((smooth f) x)
	((smooth (smooth-n f (- n 1))) x)
	)
    )
  )


