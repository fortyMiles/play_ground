(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))
      )
  )

(define (append-e L e)
  (if (null? L)
      (list e)
      (cons (car L) (append-e (cdr L) e))
      )
  )

(define (reverse L)
  (if (null? L)
      '()
      (append (reverse (cdr L)) (list (car L)))
      )
  )

(define (deep-reverse L)
  (cond ((null? L)
         '())
        ((not (pair? L))
         L
         )
        (
         (append (deep-reverse (cdr L)) (list (deep-reverse (car L))))
         )
        )
  )

(define (fringe L)
  (cond ((null? L)
         '()
         )
        (
         (not (pair? L))
         (list L)
         )
        (   
         (append (fringe (car L))
                 (fringe (cdr L))
                 )
         )
      )
  )

(define (odd num)
  (= (remainder num 2) 1)
  )

(define (same-singular num1 num2)
  (= (remainder num1 2) (remainder num2 2))
  )

(define (same-parity x . L)
  (define (parity-iter L result)
    (if (null? L)
        result
        (if (same-singular x (car L))
            (parity-iter (cdr L) (append-e result (car L)))
            (parity-iter (cdr L) result)
            )
        ))

  (parity-iter L (list x))
  )

(define (self-map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (self-map proc (cdr items))
            )
      )
  )


(define (scale L factor)
  (map (lambda (x) (* x factor)) L)
  )


(define (for_each proc items)
  (cond ((not (null? items))
       (proc (car items))
       (for_each proc (cdr items))
       )
      )
  )

(define (for-each-if proc items)
  (if (not (null? items))
      ((lambda () (proc (car items)) (for_each proc (cdr items))) )))

(define (test-lambda n)
  (if (> n 0)
      ((lambda (x) (* x 2)) n)
      )
  )

(define (self-for-each proc items)
  (cond ((not (null? items))
         (proc (car items))
         (self-for-each proc (cdr items)))))
  
