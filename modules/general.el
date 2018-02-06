;; -*- lexical-binding: t -*-

(use-package general
  :general
  (:states '(normal visual)
   "TAB" 'indent-for-tab-command)
  (:prefix "SPC"
   :states '(normal visual)
   "hdf" 'describe-function
   "hdk" 'describe-key
   "hdm" 'describe-mode
   "hdp" 'describe-package
   "hdt" 'describe-theme
   "hdv" 'describe-variable))
