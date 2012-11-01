#lang r5rs

(define (make-container)
  (define L (list '()))

  (define (has? item)
    (define (has-imp a T)
      (cond ((null? T) '#f)
	        ((eq? (car T) a) '#t)
		    (else (has-imp a (cdr T)))))
    (has-imp item L))

  (define (insert! item)
    (define (insert-imp a T)
	  (cond ((and (pair? T) (null? (car T))) (set-car! T a))
			((null? (cdr T)) (set-cdr! T (list a)))
	        (else (insert-imp a (cdr T)))))
	(insert-imp item L))

  (define (dispatch m)
    (cond ((eq? m 'has?) has?)
	      ((eq? m 'insert!) insert!)
		  ((eq? m 'show) (display L) (newline))))
  
  dispatch)

;;(define container (make-container))

;;(display ((container 'has?) 'a)) 
;;(newline)

;;((container 'insert!) 'a)
;;((container 'insert!) 'b)
;;((container 'insert!) 'c)
;;(container 'show)

;;(display ((container 'has?) 'a)) 
;;(newline)

(define (count-pairs x)
  (define table (make-container))

  (define (count-pairs-imp x)
    (cond ((not (pair? x)) 0)
	      (((table 'has?) x) 0)
		  (else (begin ((table 'insert!) x) (+ (count-pairs-imp (car x)) (count-pairs-imp (cdr x)) 1)))))

  (count-pairs-imp x))

(define v '(a b c))
(display (count-pairs v))
(newline)

(set-car! (cdr v) (cddr v))
(display (count-pairs v))
(newline)

(set-car! v (cdr v))
(display (count-pairs v))
(newline)
