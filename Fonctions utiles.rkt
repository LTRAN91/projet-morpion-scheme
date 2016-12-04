#lang racket

; Exemple d'un livre 
(define (divisible? a b)
  (if (= 0 b)
      "impossible: division par zéro"
      (begin ; Permet de combiner une séquence d'expressions à évaluer successivement
        (display "valeur des opérandes"); Affiche représentation valeur obj
        (newline)
        (display a)
        (display #\space)
        (display b)
        (newline)
        (/ a b))))

(divisible? 7 0)

; Exemple de (Cond) = forme générale de "if" avec nb qcq de branches

(define (racines? n)
  (cond ((and (number? n)(= 0 n))
         (print 0)
         'nul)
        ((and (number? n)(< 0 n))
         (print (sqrt n))
         'positif)
        (else (print "pas de racine carrée")
              'négatif-ou-non-numérique)))
(racines? -4)

; Exemple de (let) = attribue valeur à une variable

(define (surface-cercle rayon)
  (let ((pi 3.14159))
    (* pi (carre rayon))))
(define (carre x)
  (* x x))
(surface-cercle 5)
; Forme générale de let :
; (let ( <liaisons>) <corps>)
; <liaisons> est de forme:
;  (p1  exp1)
;   ...
;  (pk  expk)