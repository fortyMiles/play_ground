(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))
		 )
  )


(define (list-ref items  n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))
      )
  )

(define squares (list 1 4 9 16 25))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))
      )
  )


(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ 1 count))
	)
    )

  (length-iter items 0)
  )

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))
      )
  )

(define (last-pair L)
  (cond ((null? L)
	 #f)
	((= (length L) 1)
	 (car L))
	((last-pair (cdr L)))
      )
  )

(define (reverse L)
  (cond ((null? L)
         #f)
        ((= (length L) 1)
         L
         )
        (
         (display (cdr L))
         (display (car L))
         append (reverse (cdr L)) (list (car L)))
        )
  )
