(define (scale-tree tree factor)
  (cond ((null? tree) '())
	((not (pair? tree)) (* tree factor))
	(else (cons (scale-tree (car tree) factor)
		    (scale-tree (cdr tree) factor)
	      )
	)
	))

(define (scale-tree-map tree factor)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (scale-tree-map sub-tree factor)
	     (* sub-tree factor) ; is not pair just leaves
	     )
	 )
       tree
       )
  )


(define (square-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (square tree)) ; tree is the leave
	(else (cons (square-tree (car tree))
		    (square-tree (cdr tree))
		    ))

	)
  )

(define (square-tree-map tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree-map sub-tree)
	     (square sub-tree)
	     )
	 )
       tree
       )
  )

(define (tree-map func tree)
  (map (lambda (sub-tree)
	 (cond ((pair? sub-tree)
		(tree-map func sub-tree))
	       (else (func sub-tree))))
       tree))

(define (subsets s)
  (define nil '())
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (e) (cons (car s) e)) rest)))))


(define (filter predicate sequence)
  (define nil '())
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence)))
	 )
	(else (filter predicate (cdr sequence)))
	))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence))
	  )
      )
  )

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest)
	      )
	)
    )
  (iter initial sequence)
  )

;; 3.39
(define (reverse sequence)
  (accumulate (lambda (x y) (append y (list x))) '() sequence)
  )

(define (reverse-2 sequence)
  (fold-left (lambda (x y) (append (list y) x)) '() sequence)
  )

(define (self-map p sequence)
  (define nil '())
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence)
  )

(define (append-self seq1 seq2)
  (accumulate cons seq2 seq1)
  )

(define (length-self sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)
  )

; Exerise 2.34 Evaluating a polynomial
(define (horner-eval x cofficient-sequence)
  (accumulate (lambda (this-coffee higher-items)
		(+ this-coffee (* x higher-items))
		)
	      0
	      cofficient-sequence
	      ))


;Exerise 2.35 Redifine count-leaves as an accumulation
(define (count-leaves t)
  (accumulate + 0 (map (lambda (subtree)
			 (if (pair? subtree)
			     (count-leaves subtree)
			     1
			     ))
		       t)))



;; Exerise 2.36 Accumulate n
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (e) (car e)) seqs))
	    (accumulate-n op init (map (lambda (e) (cdr e)) seqs))
	    )
      )
  )

;; 2.37 Martix Operations

(define (dot-product v w)
  (accumulate + 0 (map * v w))
  )

(define (martix-*-vector m v)
  (map (lambda (m-i) (dot-product v)) m)
  )

;; Exerise 2.38
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest)
	)
    )
    )
  (iter initial sequence)
  )

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))
      )
  )

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))
		      ))
	)
  )

(define (fib n)
  (cond ((= n 1)
	 1)
	((= n 0)
	 0)
	(else (+ (fib (- n 1)) (fib (- n 2))))
	)
  )

(define (sum-odd-squares tree)
  (accumulate +
	      0
	      (map square
		   (filter odd? (enumerate-tree tree))))
  )


(define (even-fibs n)
  (accumulate cons '()
	      (filter even? (map fib (enumerate-interval 0 n))))
  )

(define (map p sequence)
  (accumulate (lambda (x y) (p x)) nil sequence)
  )
