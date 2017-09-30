#lang at-exp racket
(require (only-in sugar/list values->list))

(define (apply↑* f . args)
  (define f↑1-res
    (values->list
     (apply f args)))
  (define f↑2-res
    (values->list
     (apply f f↑1-res)))
  (if (equal? f↑1-res f↑2-res)
      (apply
       values
       f↑1-res)
      (apply
       apply↑*
       (cons
        f
        f↑2-res))))
(module+ test
  (require rackunit)
  (let-values ([(r1 r2)
                (apply↑*
                 (λ (a b)
                   (if (or (>= a 10) (>= b 5))
                       (values a b)
                       (values (add1 a) (add1 b))))
                 1 3)])
    (check-equal? r1 3)
    (check-equal? r2 5)))
;; doesn't work with proc-doc/names :-(
(provide
 (contract-out
  (apply↑*
   (->*
    (procedure?)
    #:rest (listof any/c)
    any))))

(define (apply↑ n f . args)
  (if (equal? n 0)
      (apply values args)
      (let ([f↑1-res
             (values->list
              (apply f args))])
        (apply
         apply↑
         (append
          (list
           (sub1 n)
           f)
          f↑1-res)))))
(module+ test
  (let-values ([(r1 r2)
                (apply↑
                 3
                 (λ (a b)
                   (values
                    (add1 a)
                    (add1 b)))
                 1
                 3)])
    (check-equal? r1 4)
    (check-equal? r2 6)))
;; doesn't work with proc-doc/names :-(
(provide
 (contract-out
  (apply↑
   (->*
    (exact-positive-integer? procedure?)
    #:rest (listof any/c)
    any))))