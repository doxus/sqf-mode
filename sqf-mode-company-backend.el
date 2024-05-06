(require 'company)
(require 'sqf-mode)

(defconst company-sqf-completions (append sqf-mode-keywords '("and" "do" "else" "exit" "exitWith" "false" "for" "forEach" "forEachMember" "forEachMemberAgent" "forEachMemberTeam" "from" "if" "in" "nil" "not" "or" "then" "to" "true" "try" "waitUntil" "with" "while")))

(defun company-sqf-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
    (interactive (company-begin-backend 'company-sqf-backend))
    (prefix (and (eq major-mode 'sqf-mode)
                (company-grab-symbol)))
    (candidates
    (cl-remove-if-not
      (lambda (c) (string-prefix-p arg c))
      company-sqf-completions))))

(add-to-list 'company-backends 'company-sqf-backend)
