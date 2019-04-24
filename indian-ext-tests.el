;;; indian-ext-tests.el  --- Tests for an extension to indian language utilities -*- lexical-binding: t -*-

;; Copyright (C) 2015--2019 Patrick McAllister

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

;; Typical invocation (from the root directory of this repository):

;; /usr/bin/emacs -Q -batch -L . -l ert -l indian-ext-tests.el  -f ert-run-tests-batch-and-exit

;;; Code:

(require 'ert)
(require 'indian-ext)

(ert-deftest test-indian-ext-dev-velthuis-encode-region ()
  (with-temp-buffer
    (insert "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।")
    (indian-ext-dev-velthuis-encode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "pramaa.nabhuutaaya jagaddhitai.si.ne pra.namya \"saastre sugataaya taayine ."))))




(ert-deftest test-indian-ext-dev-velthuis-decode-region ()
  (with-temp-buffer
    (insert "pramaa.nabhuutaaya jagaddhitai.si.ne pra.namya \"saastre sugataaya taayine .")
    (indian-ext-dev-velthuis-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))
    (erase-buffer)
    (insert (upcase-initials "pramaa.nabhuutaaya jagaddhitai.si.ne pra.namya \"saastre sugataaya taayine ."))
    (indian-ext-dev-velthuis-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))))

(ert-deftest test-indian-ext-dev-slp1-encode-region ()
  (with-temp-buffer
    (insert "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।")
    (indian-ext-dev-slp1-encode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "pramARaBUtAya jagadDitEziRe praRamya SAstre sugatAya tAyine ."))))

(ert-deftest test-indian-ext-dev-slp1-decode-region ()
  (with-temp-buffer
    (insert "pramARaBUtAya jagadDitEziRe praRamya SAstre sugatAya tAyine .")
    (indian-ext-dev-slp1-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))))

(ert-deftest test-indian-ext-dev-iast-encode-region ()
  
  (with-temp-buffer
    (insert "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।")
    (indian-ext-dev-iast-encode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "pramāṇabhūtāya jagaddhitaiṣiṇe praṇamya śāstre sugatāya tāyine ."))))

(ert-deftest test-indian-ext-dev-iast-decode-region ()
  (with-temp-buffer
    (insert "pramāṇabhūtāya jagaddhitaiṣiṇe praṇamya śāstre sugatāya tāyine .")
    (indian-ext-dev-iast-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))
    (erase-buffer)
    (insert (upcase-initials "pramāṇabhūtāya jagaddhitaiṣiṇe praṇamya śāstre sugatāya tāyine ।"))
    (indian-ext-dev-iast-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "प्रमाणभूताय जगद्धितैषिणे प्रणम्य शास्त्रे सुगताय तायिने ।"))))


(ert-deftest test-indian-ext-dev-iast-encode-punctuation-om ()
  (with-temp-buffer
    (insert "om: o m: OM; | “atra” / yad // śubham.")
    (indian-ext-dev-iast-decode-region (point-min) (point-max))
    (should
     (equal
      (buffer-substring-no-properties (point-min) (point-max))
      "om: ओ म्: ॐ; | “अत्र” / यद् // शुभम्।"))))
;; (ert "indian-ext-dev-iast-encode-punctuation-test")

(ert-deftest test-indian-ext-slp1-jya-1 ()
  (should
   (equal
    (indian-ext-dev-slp1-encode-string "प्रयुज्यते")
    "prayujyate")))

(ert-deftest test-indian-ext-slp1-jya-2 ()
  (let ((case-fold-search nil))
    (should
     (equal
      (indian-ext-dev-slp1-decode-string
       (indian-ext-dev-slp1-encode-string "प्रयुज्यते"))
      "प्रयुज्यते"))))

;; Functions should work independently of user’s case-fold-search setting

(ert-deftest test-indian-ext-roundtrips-force-case-fold-search-off ()
  (let ((case-fold-search nil)
        (cases '("ज्ञानम्"
                 "क्षणभङ्ग"
                 "प्रयुज्यते"
                 "अत्र"
                 "किं तर्हि")))
    (dolist (coder '(slp1 velthuis iast))
      (mapc
       (lambda (c)
         (should
          (equal
           (funcall (intern (format "indian-ext-dev-%s-decode-string" coder))
                    (funcall (intern (format "indian-ext-dev-%s-encode-string" coder))
                             c))
           c)))
       cases))))


(ert-deftest test-indian-ext-roundtrips-force-case-fold-search-on ()
  (let ((case-fold-search t)
        (cases '("ज्ञानम्"
                 "क्षणभङ्ग"
                 "प्रयुज्यते"
                 "अत्र"
                 "किं तर्हि")))
    (dolist (coder '(slp1 velthuis iast))
      (mapc
       (lambda (c)
         (should
          (equal
           (funcall (intern (format "indian-ext-dev-%s-decode-string" coder))
                    (funcall (intern (format "indian-ext-dev-%s-encode-string" coder))
                             c))
           c)))
       cases))))



(provide 'indian-ext-tests)

;;; indian-ext-tests.el ends here
