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

(define (accumalate-iter func begin end inc-func)
  (define (iter a result)
    (if (> a end)
	result
	(iter (inc-func a) (+ (func a) result))
	)
    )
  (iter begin 0)
  )

(define (d k n)
  (if (or (= k 0) (= k n))
      1
      (pow 2 simp-exp k)
      )
  )


(define (simp-inte func a b n)
  (let ([h (/ (- b a) n)])
    (define (y i) (func (+ a (* i h))))
    (define (inc x) (+ x 1))
    (/ (* h (accumalate (lambda (i) (* (d i n) (y i))) 0 n inc))
       3)
    )
  )

(define (product func a b next)
  (if (> a b)
      1
      (* (func a) (product func (next a) b next))
      )
  )

(define (factorial n)
  (product (lambda (x) x) 1 n (lambda (x) (+ x 1)))
  )

(define (pi-term n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))
      )
  )


(define (product-iter func a b next)
  (define (iter i result)
    (if (> i b)
	result
	(iter (next i) (* (func i) result))
	)
    )

  (iter a 1)
  )


(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))
      )
  )

(define (acc-iter combiner null-value term a next b)
  (define (iter i result)
    (if (> i b)
	result
	(iter (next i) (combiner i result))
	)
    )
  (iter 1 null-value)
  )

