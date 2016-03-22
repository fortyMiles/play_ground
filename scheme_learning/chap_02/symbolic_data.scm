(define (memq item x)
  (cond ((null? x) #f)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))
	)
  )

(define (equal? item-1 item-2)
  (cond ((and (null? item-1) (null? item-2))
	 #t)
	 ((not (eq? (car item-1) (car item-2)))
	  #f
	  )
	 (else (equal? (cdr item-1) (cdr item-2)))
	 ))

(define (variable? e)
  (symbol? e)
  )

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2))
  )

(define (sum? e)
  (and (pair? e) (eq? (car e) '+))
  )

(define (addend e)
  (cadr e)
  )

(define (augend e)
  (caddr e)
  )

(define (make-sum a1 a2)
  (cond ((=number? a1 0)
	 a2)
	((=number? a2 0)
	 a1)
	((and (number? a1) (number? a2))
	 (+ a1 a2))
	(else (list '+ a1 a2))
	)
  )

(define (=number? exp num)
  (and (number? exp) (= exp num))
  )

(define (product? e)
  (and (pair? e) (eq? (car e) '*))
  )

(define (multiplier e)
  (cadr e)
  )

(define (multiplicand e)
  (caddr e)
  )

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m1)
	((=number? m2 1) m2)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))
	))

(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**))
  )

(define (base e)
  (cadr e)
  )

(define (exponent e)
  (caddr e)
  )

(define (make-exponentiation m1 m2)
  (cond ((=number? m2 0) 1)
	((=number? m2 1) m2)
	)
  )

(define (deriv exp var)
  (cond ((number? exp) 0) ;; it constant return 0
	((variable? exp)
	 (if (same-variable? exp var) 1 0)); dx/dx = 1
	((exponentiation? exp)
	 (make-exponentiation (make-product (exponent exp)
				 (make-exponentiation (base exp) (- (exponent exp) 1)))
			      (deriv (base exp) var)
			      )
	 )
	((sum? exp) (make-sum (deriv (addend exp) var)
			      (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var)
			)
	  (make-product (deriv (multiplier exp) var)
			(multiplicand exp)
			)
	  )
	 )
	(else error "unknow expression type: DERIV" exp)
	))

