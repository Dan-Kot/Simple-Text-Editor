;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Text-Editor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct editor [pre post])
; An Editor is a structure:
;    (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible txt is (string-append s t) with
; the cursor displayed between s and t

; render : Editor -> Image
(check-expect (render (make-editor "hello" " world"))
              (overlay/align "left" "center"
                             (text "hello world" 11 "black")
                             (empty-scene 200 20)))
(define (render an-editor)
  (overlay/align "left" "center"
                 (text (string-append (editor-pre an-editor) (editor-post an-editor)) 11 "black")
                 (empty-scene 200 20)))

; edit : Editor KeyEvent -> Editor
(check-expect (edit (make-editor "hello" "world") "a") (make-editor "helloa" "world"))
(check-expect (edit (make-editor "Dani" "Kot") "\b") (make-editor "Dan" "Kot"))
(define (edit ed ke)
  (cond [(string=? ke "\b") (make-editor (string-remove-last (editor-pre ed)) (editor-post ed))]
        [(string=? ke "a") (make-editor (string-append (editor-pre ed) "a") (editor-post ed))]
        [(string=? ke "b") (make-editor (string-append (editor-pre ed) "b") (editor-post ed))]
        [(string=? ke "c") (make-editor (string-append (editor-pre ed) "c") (editor-post ed))]
        [(string=? ke "d") (make-editor (string-append (editor-pre ed) "d") (editor-post ed))]
        [(string=? ke "e") (make-editor (string-append (editor-pre ed) "e") (editor-post ed))]
        [(string=? ke "f") (make-editor (string-append (editor-pre ed) "f") (editor-post ed))]
        [(string=? ke "g") (make-editor (string-append (editor-pre ed) "g") (editor-post ed))]
        [(string=? ke "h") (make-editor (string-append (editor-pre ed) "h") (editor-post ed))]
        [(string=? ke "i") (make-editor (string-append (editor-pre ed) "i") (editor-post ed))]
        [(string=? ke "j") (make-editor (string-append (editor-pre ed) "j") (editor-post ed))]
        [(string=? ke "k") (make-editor (string-append (editor-pre ed) "k") (editor-post ed))]
        [(string=? ke "l") (make-editor (string-append (editor-pre ed) "l") (editor-post ed))]
        [(string=? ke "m") (make-editor (string-append (editor-pre ed) "m") (editor-post ed))]
        [(string=? ke "n") (make-editor (string-append (editor-pre ed) "n") (editor-post ed))]
        [(string=? ke "o") (make-editor (string-append (editor-pre ed) "o") (editor-post ed))]
        [(string=? ke "p") (make-editor (string-append (editor-pre ed) "p") (editor-post ed))]
        [(string=? ke "q") (make-editor (string-append (editor-pre ed) "q") (editor-post ed))]
        [(string=? ke "r") (make-editor (string-append (editor-pre ed) "r") (editor-post ed))]
        [(string=? ke "s") (make-editor (string-append (editor-pre ed) "s") (editor-post ed))]
        [(string=? ke "t") (make-editor (string-append (editor-pre ed) "t") (editor-post ed))]
        [(string=? ke "u") (make-editor (string-append (editor-pre ed) "u") (editor-post ed))]
        [(string=? ke "v") (make-editor (string-append (editor-pre ed) "v") (editor-post ed))]
        [(string=? ke "w") (make-editor (string-append (editor-pre ed) "w") (editor-post ed))]
        [(string=? ke "x") (make-editor (string-append (editor-pre ed) "x") (editor-post ed))]
        [(string=? ke "y") (make-editor (string-append (editor-pre ed) "y") (editor-post ed))]
        [(string=? ke "z") (make-editor (string-append (editor-pre ed) "z") (editor-post ed))]
        [(string=? ke "1") (make-editor (string-append (editor-pre ed) "1") (editor-post ed))]
        [(string=? ke "2") (make-editor (string-append (editor-pre ed) "2") (editor-post ed))]
        [(string=? ke "3") (make-editor (string-append (editor-pre ed) "3") (editor-post ed))]
        [(string=? ke "4") (make-editor (string-append (editor-pre ed) "4") (editor-post ed))]
        [(string=? ke "5") (make-editor (string-append (editor-pre ed) "5") (editor-post ed))]
        [(string=? ke "6") (make-editor (string-append (editor-pre ed) "6") (editor-post ed))]
        [(string=? ke "7") (make-editor (string-append (editor-pre ed) "7") (editor-post ed))]
        [(string=? ke "8") (make-editor (string-append (editor-pre ed) "8") (editor-post ed))]
        [(string=? ke "9") (make-editor (string-append (editor-pre ed) "9") (editor-post ed))]
        [(string=? ke "0") (make-editor (string-append (editor-pre ed) "0") (editor-post ed))]
        ))


; string-remove-last : String -> String
(check-expect (string-remove-last "Dani") "Dan")
(define (string-remove-last a-str)
  (substring a-str 0 (- (string-length a-str) 1)))


(define (main ws)
  (big-bang ws
    [on-draw render]
    [on-key edit]))

;run
(main (make-editor "hello" "world"))