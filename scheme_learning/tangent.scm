(define (cont-frac n d k)
  (define (cont-iter i)
    (/ (n i)
       (+ (d i)
	  (if (>= i k)
	      0
	      (cont-iter (+ i 1))
	      )
	  )
       )
    )

  (cont-iter 1)
  )


(define (cont-frac-iter n d k)
  (define init-result (/ (n k) (d k)))
  (define (iter i result)
    (if (= i 0)
	result
	(iter (- i 1) ((d i) ))
	)
    )
  )
