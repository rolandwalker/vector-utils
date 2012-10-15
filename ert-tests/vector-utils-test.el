
(require 'vector-utils)

;;; vector-utils-flatten

(ert-deftest vector-utils-flatten-01 nil
  (should
   (equal '[]
          (vector-utils-flatten '[]))))

(ert-deftest vector-utils-flatten-02 nil
  (should
   (equal '[nil]
          (vector-utils-flatten '[nil]))))

(ert-deftest vector-utils-flatten-03 nil
  (should
   (equal '[1]
          (vector-utils-flatten '[1]))))

(ert-deftest vector-utils-flatten-04 nil
  (should
   (equal '[1]
          (vector-utils-flatten '[1 []]))))

(ert-deftest vector-utils-flatten-05 nil
  (should (equal '[a b c d e f]
                 (vector-utils-flatten '[a b c [d e [f]]]))))

(ert-deftest vector-utils-flatten-06 nil
  (should (equal '[a nil b nil c nil d nil e nil f nil nil nil]
                 (vector-utils-flatten '[a nil b nil c nil [d nil e nil [f nil] nil] nil]))))

(ert-deftest vector-utils-flatten-07 nil
  (should (equal '[a nil b (2) c nil d nil e nil f nil nil]
                 (vector-utils-flatten '[a nil b (2) c nil [d nil e nil [f []] nil] nil]))))

(ert-deftest vector-utils-flatten-08 nil
  (should-error
   (vector-utils-flatten nil)))

(ert-deftest vector-utils-flatten-09 nil
  (should-error
   (vector-utils-flatten "string")))


;;; vector-utils-depth

(ert-deftest vector-utils-depth-01 nil
  (should
   (= 0
      (vector-utils-depth '[]))))

(ert-deftest vector-utils-depth-02 nil
  (should
   (= 0
      (vector-utils-depth "not a vector"))))

(ert-deftest vector-utils-depth-03 nil
  (should
   (= 1
      (vector-utils-depth '[1 2 3]))))

(ert-deftest vector-utils-depth-04 nil
  (should
   (= 3
      (vector-utils-depth '[a b c [d e [f]]]))))

(ert-deftest vector-utils-depth-05 nil
  (should
   (= 3
      (vector-utils-depth '[a nil b nil c nil [d nil e nil [f []] nil] nil]))))

(ert-deftest vector-utils-depth-06 nil
  (should
   (= 3
      (vector-utils-depth '[a nil b nil c nil [d nil e nil [f (4 5) []] nil] nil]))))


;;; vector-utils-insert-before

(ert-deftest vector-utils-insert-before-01 nil
  (should
   (equal '[1 2 3 four 4 5]
          (vector-utils-insert-before '[1 2 3 4 5] 4 'four))))

(ert-deftest vector-utils-insert-before-02 nil
  (should
   (equal '[elt 1 2 3 4 5]
          (vector-utils-insert-before '[1 2 3 4 5] 1 'elt))))

(ert-deftest vector-utils-insert-before-03 nil
  (should
   (equal '[1 2 3 4 elt 5]
          (vector-utils-insert-before '[1 2 3 4 5] 5 'elt))))

(ert-deftest vector-utils-insert-before-04 nil
  (should-error
   (vector-utils-insert-before '[1 2 3 4 5] 6 'elt)))


;;; vector-utils-insert-after

(ert-deftest vector-utils-insert-after-01 nil
  (should
   (equal '[1 2 3 4 four 5]
          (vector-utils-insert-after '[1 2 3 4 5] 4 'four))))

(ert-deftest vector-utils-insert-after-02 nil
  (should
   (equal '[1 elt 2 3 4 5]
          (vector-utils-insert-after '[1 2 3 4 5] 1 'elt))))

(ert-deftest vector-utils-insert-after-03 nil
  (should
   (equal '[1 2 3 4 5 elt]
          (vector-utils-insert-after '[1 2 3 4 5] 5 'elt))))

(ert-deftest vector-utils-insert-after-04 nil
  (should-error
   (vector-utils-insert-after '[1 2 3 4 5] 6 'elt)))


;;; vector-utils-insert-before-pos

(ert-deftest vector-utils-insert-before-pos-01 nil
  (should
   (equal '[a b c three d e]
          (vector-utils-insert-before-pos '[a b c d e] 3 'three))))

(ert-deftest vector-utils-insert-before-pos-02 nil
  (should
   (equal '[elt a b c d e]
          (vector-utils-insert-before-pos '[a b c d e] 0 'elt))))

(ert-deftest vector-utils-insert-before-pos-03 nil
  (should
   (equal '[a b c d elt e]
          (vector-utils-insert-before-pos '[a b c d e] 4 'elt))))

(ert-deftest vector-utils-insert-before-pos-04 nil
  (should-error
   (vector-utils-insert-before-pos '[a b c d e] 5 'elt)))


;;; vector-utils-insert-after-pos

(ert-deftest vector-utils-insert-after-pos-01 nil
  (should
   (equal '[a b c d three e]
          (vector-utils-insert-after-pos '[a b c d e] 3 'three))))

(ert-deftest vector-utils-insert-after-pos-02 nil
  (should
   (equal '[a elt b c d e]
          (vector-utils-insert-after-pos '[a b c d e] 0 'elt))))

(ert-deftest vector-utils-insert-after-pos-03 nil
  (should
   (equal '[a b c d e elt]
          (vector-utils-insert-after-pos '[a b c d e] 4 'elt))))

(ert-deftest vector-utils-insert-after-pos-04 nil
  (should-error
   (vector-utils-insert-after-pos '[a b c d e] 5 'elt)))


;;
;; Emacs
;;
;; Local Variables:
;; indent-tabs-mode: nil
;; mangle-whitespace: t
;; require-final-newline: t
;; coding: utf-8
;; byte-compile-warnings: (not cl-functions)
;; End:
;;

;;; vector-utils-test.el ends here
