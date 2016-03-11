;(define (cons x y)
;  (define (dispatch m)
;    (cond ((= m 0) x)
;	  ((= m 1) y)
;	  (else (error "argument not 0 or 1: CONS" m))
;	  ))
;  dispatch
;  )

(define (car z) (z 0))
(define (cdr z) (z 1))


(define (cons x y)
  (lambda (m) (m x y))
  )

(define (car z)
  (z (lambda (first second) first))
  )

(define (cdr z)
  (z (lambda (first second) second))
  )

(define (find-root num a)
  ; a*n = num return n
  (expt (num (/ 1 a)))
  )

(define (self-cons a b)
  (* (expt 2 a) (expt 3 b))
  )


(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))
  )
