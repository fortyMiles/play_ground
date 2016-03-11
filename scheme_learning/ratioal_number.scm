(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))

            (* (denom x) (denom y)))
  )

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x))
               )
            (* (denom x) (denom y))
            )
  )

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))
            )
  )

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))
            )
  )

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))
     )
  )

(define (make-rat n d)
  (let (
	[g (gcd (abs n) (abs d))]
	)
    (if (< (* n d) 0)
	(cons (* -1 (/ (abs n) g)) (/ (abs d) g))
	(cons (/ (abs n) g) (/ (abs d) g))
	)
    ))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
;  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline)
  )
