(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))
      )
  )

(define (cube x)
  (* x x x)
  )

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
	 (sum-cubes (+ a 1) b)
	 )
      )
  )

(define (pow n f k)
  (expt n (f k))
  )


(define (simp-exp k)
  (+ 1 (remainder k 2))
  )

(define (accumalate func begin end inc-func)
  (let ([next (inc-func begin)])
   ; (display next)
    (if (> begin end)
	0
	(+ (func begin) (accumalate func next end inc-func))
	)
    )
  )

(define (d k n)
  (if (or (= k 0) (= k n))
      1
      (pow 2 simp-exp k)
      )
  )

(define (inc x) (+ x 1))

(define (simp-inte func a b n)
  (let ([h (/ (- b a) n)])
    (define (y i) (func (+ a (* i h))))
    (/ (* h (accumalate (lambda (i) (* (d i n) (y i))) 0 n inc))
       3)
    )
  )
