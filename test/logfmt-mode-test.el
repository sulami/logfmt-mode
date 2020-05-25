;;; logfmt-mode-test.el --- Tests for logfmt-mode

(require 'ert)
(require 'faceup)

(defun logfmt-font-lock-test (faceup)
  (faceup-test-font-lock-string 'logfmt-mode faceup))
(faceup-defexplainer logfmt-font-lock-test)

(ert-deftest logfmt-font-lock-test ()
  "logfmt font-lock tests."
  ;; Single value
  (should (logfmt-font-lock-test "«v:foo»"))
  ;; Multiple values
  (should (logfmt-font-lock-test "«v:foo» «v:bar»"))
  ;; Key-value pair
  (should (logfmt-font-lock-test "«v:foo»«b:=»bar"))
  ;; String
  (should (logfmt-font-lock-test "«v:foo»«b:=»«s:\"bar\"»"))
  ;; Complex example
  (should (logfmt-font-lock-test "«v:foo»«b:=»bar «v:a»«b:=»14 «v:baz»«b:=»«s:\"hello kitty\"» «v:cool%story»«b:=»bro «v:f» «v:%^asdf»")))

;;; logfmt-mode-test.el ends here
