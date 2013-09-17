;; init.el --- Where all the magic begins


;; Mac specific Modifiers
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq ns-function-modifier 'hyper)


;; Easy Zooming
(global-set-key (kbd "M-<wheel-down>") 'text-scale-increase)
(global-set-key (kbd "M-<wheel-up>") 'text-scale-decrease)


;; Marmalade and Melpa repos
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
			 '("melpa" .
			   "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; Libraries
(load-file "~/.emacs.d/better-defaults.el")
(load-file "~/.emacs.d/user-funcs.el")
(load-file "~/.emacs.d/user-settings.el")
(load-file "~/.emacs.d/packages.el")




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"])
 '(ansi-term-color-vector [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"] t)
 '(csv-separators (quote ("," "|")))
 '(custom-safe-themes (quote ("46d144d6dd1f81a3f15da043758d6897e110597ee37e1c32bd846cc6353736de" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "635518bf81b80533e3ee3a76d55f992494ea7bf3018bf58cd3d44f100d66fa8e" "050beead9159996a613ba4bc734de8b13b882f1c6596d1dffa4f51d096662cf6" "7fa9dc3948765d7cf3d7a289e40039c2c64abf0fad5c616453b263b601532493" "ac191d0ff71167c4b07d38eb2480eeba3eead12c0c60a7dce150627722c79e62" "3bd9497fb8f39c28ab58a9e957152ba2dc41223c23c5520ef10fc7bd6b222384" "1278386c1d30fc24b4248ba69bc5b49d92981c3476de700a074697d777cb0752" "9f42bccce1e13fa5017eb8718574db099e85358b9f424db78e7318f86d1be08f" "88b663861db4767f7881e5ecff9bb46d65161a20e40585c8128e8bed8747dae5" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "f89e21c3aef10d2825f2f079962c2237cd9a45f4dc1958091be8a6f5b69bb70c" "bad832ac33fcbce342b4d69431e7393701f0823a3820f6030ccc361edd2a4be4" "3c67d690c2d801885c06f00c99c7a12c3490ce3b655be3fdc8ecc4fe0ff55706" "1c1e6b2640daffcd23b1f7dd5385ca8484a060aec901b677d0ec0cf2927f7cde" "b8f561a188a77e450ab8a060128244c81dea206f15c1152a6899423dd607b327" "9ea054db5cdbd5baa4cda9d373a547435ba88d4e345f4b06f732edbc4f017dc3" "1cf3f29294c5a3509b7eb3ff9e96f8e8db9d2d08322620a04d862e40dc201fe2" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "60e70079a187df634db25db4bb778255eaace1ef4309e56389459fb9418b4840" "fc6e906a0e6ead5747ab2e7c5838166f7350b958d82e410257aeeb2820e8a07a" "085b401decc10018d8ed2572f65c5ba96864486062c0a2391372223294f89460" "495adf3bee5eac6c5fbad743be36ea86a9d33d3da16b1c0643a6ec2742fda496" "a2e0816c1a4bea13ac9c7b7c84f22408e1ffe23cfef4c6c75a71e3dafdc9343b" "06f5145c01ec774a0abb49eeffa3980743ce2f997112b537effeb188b7c51caf" "936e5cac238333f251a8d76a2ed96c8191b1e755782c99ea1d7b8c215e66d11e" default)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#192028")
 '(fringe-mode 10 nil (fringe))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#F2F2F2" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#6DA8D2" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#F2F2F2" . 100))))
 '(hippie-expand-try-functions-list (quote (try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(linum-format " %6d ")
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(main-line-separator-style (quote chamfer))
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


