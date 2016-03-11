(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))

            (* (demon x) (demon y)))
  )

(define (sub-rat x y)
  (make-rat (- (* (numer x) (demon y))
               (* (numer y) (demon x))
               )
            (* (demon x) (denom y))
            )
  )

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (demon x) (denom y))
            )
  )

(define (div-rat x y)
  (make-rat (* (numer x) (demon y))
            (* (demon x) (numer y))
            )
  )

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))
     )
  )

