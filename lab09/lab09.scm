(define (over-or-under num1 num2) 
  (if (< num1 num2) -1 (if (> num1 num2) 1 0))
)

(define (make-adder num) 
  (lambda (inc) (+ num inc))
)

(define (composed f g)
  (lambda (x) (f (g x)))
)

(define (repeat f n) 
  (if (< n 1)
    (lambda (x) x)
    (composed (repeat f (- n 1)) f)
  )
)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b)
  (if (< a b)
    (gcd b a)
    (if (= (modulo a b) 0)
    b
    (gcd b (modulo a b)))
  )
)

(define (duplicate lst)
  (if (null? lst)
    nil
    (cons (car lst) (cons (car lst) (duplicate (cdr lst))))
  )
)

(expect (duplicate '(1 2 3)) (1 1 2 2 3 3))

(expect (duplicate '(1 1)) (1 1 1 1))

(define (deep-map fn s)
  (if (null? s)
    nil
    (if (list? (car s))
      (cons (deep-map fn (car s)) (deep-map fn (cdr s)))
      (cons (fn (car s)) (deep-map fn (cdr s)))
    )
  )
)
