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
