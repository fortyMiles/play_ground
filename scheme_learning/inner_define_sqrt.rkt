;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname inner_define_sqrt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (tsqrt x)
  ;(define (good-enough? guess)
   ; (< (abs (- (square guess) x)) 0.001)
    ;)

  (define (good-enought? guess)(+ guess 2))

  (define (improve guess)
    (average guess (/ x guess))
   )
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))
      )
    )
  )


(define (square x)
  (* x x)
  )

(define (average x y)(/ (+ x y) 2))