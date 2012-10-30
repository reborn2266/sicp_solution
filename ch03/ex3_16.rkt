#lang r5rs

(define (bad-count-pairs x)
  (if (not (pair? x))
      0
      (+ (bad-count-pairs (car x))
         (bad-count-pairs (cdr x))
         1)))

(define v '(a b c))
(display (bad-count-pairs v))
(newline)

(set-car! (cdr v) (cddr v))
(display (bad-count-pairs v))
(newline)

(set-car! v (cdr v))
(display (bad-count-pairs v))
(newline)

;; this may cause computer hanged for a while
(set-car! (cdr v) (cdr v))
(display (bad-count-pairs v))

(newline)
