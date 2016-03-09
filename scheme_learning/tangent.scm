(define (cont-frac n d k op)
  (define (cont-iter i)
    (/ (n i)
       (op (d i)
	  (if (>= i k)
	      0
	      (cont-iter (+ i 1))
	      )
	  )
       )
    )

  (cont-iter 1)
  )

(define (tangent x k)
  (define (func-x i)
    (if (= i 1)
	x
	(* x x)
	)
    )

  (define (d i)
    (- (* 2 i) 1)
    )

  (cont-frac func-x d k -)
  )

(define (cont-frac-iter n d k)
  (define (combine r i)
    (/ (n i) (+ (d i) r))
    )
  (define init-result (/ (n k) (d k)))
  (define (iter i result)
    (if (= i 1)
	result
	(iter (- i 1) (combine result (- i 1)))
	)
    )

  (iter k init-result)
  )

(define (euler i)
  (let ([r (/ (- i 2) 3)])
    (cond ((= i 1)
	   1
	   )
	  ((= (remainder (- i 2) 3) 0)
	   (* 2 (+ 1 r))
	   )
	  (else
	   1
	   )
	)
    )
  )

(define (euler-e k)
  (+ 2
     (cont-frac-iter (lambda (i) 1.0) euler k)
     )
  )



