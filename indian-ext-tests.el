;;; indian-ext-tests.el  --- Tests for an extension to indian language utilities

;; Copyright (C) 2015 Patrick McAllister

;; Author: Patrick McAllister <pma@rdorte.org>
;; Keywords: tests, ert
;; URL: https://github.com/paddymcall/ind-util-extension

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is the collection of tests to see how ind-ext.el is behaving.

;; Typical invocation:

;; emacs -batch -l ert -l ind-ext.el -l tests.el  -f ert-run-tests-batch-and-exit

;;; Code:

(require 'ert)
;; flycheck was complaining about (require 'indian-ext)?
(load-file "indian-ext.el")

(ert-deftest indian-ext-dev-velthuis-encode-region-test ()
  (with-temp-buffer
    (insert "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।")
    (indian-ext-dev-velthuis-encode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "pramaa.nabhuutaaya jagaddhitai.si.ne pra.namya \"saastre sugataaya taayine ."))))




(ert-deftest indian-ext-dev-velthuis-decode-region-test ()
  (with-temp-buffer
    (insert "pramaa.nabhuutaaya jagaddhitai.si.ne pra.namya \"saastre sugataaya taayine .")
    (indian-ext-dev-velthuis-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))))



(ert-deftest indian-ext-dev-slp1-encode-region-test ()
  (with-temp-buffer
    (insert "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।")
    (indian-ext-dev-slp1-encode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "pramARaBUtAya jagadDitEziRe praRamya SAstre sugatAya tAyine ."))))

(ert-deftest indian-ext-dev-slp1-decode-region-test ()
  (with-temp-buffer
    (insert "pramARaBUtAya jagadDitEziRe praRamya SAstre sugatAya tAyine .")
    (indian-ext-dev-slp1-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))))

(ert-deftest indian-ext-dev-iast-encode-region-test ()
  
  (with-temp-buffer
    (insert "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।")
    (indian-ext-dev-iast-encode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "pramāṇabhūtāya jagaddhitaiṣiṇe praṇamya śāstre sugatāya tāyine ।"))))

(ert-deftest indian-ext-dev-iast-decode-region-test ()
  (with-temp-buffer
    (insert "pramāṇabhūtāya jagaddhitaiṣiṇe praṇamya śāstre sugatāya tāyine ।")
    (indian-ext-dev-iast-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
       "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))))

(provide 'indian-ext-tests)

;;; indian-ext-tests.el ends here
