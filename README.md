# load-directory-mu

load all emacs lisp files from sub-directories

## Overview

This library provides functionality to load recursively all `.el` files contained in a specified directory (along with all files in sub-directories).

Original functionality was written by Emanuele Tomasi as a discussion for improving `recursive-subdirs` routine. Please see:

```
http://www.emacswiki.org/emacs/DotEmacsModular
```

The library has been called `load-directory-mu` so as not to confuse it with other libraries that offer more functionality. For example take a look at:

```
http://www.cb1.com/~john/computing/emacs/lisp/basics/load-directory.el
```

`mu` in `load-directory-mu` stands for the Greek letter `/mu:/`. In physics this letter represents the concept of "reduced mass". This library is a "reduced version" of it's bigger implementations =)

## Installing

To install this library, save the file `load-directory-mu.el` to a directory in your `load-path` (you can view the current `load-path` using `C-h v load-path` within Emacs), then add the following line to your `.emacs` start up file:

```
(require 'load-directory-mu)
```

## Using

For example, suppose your `~/.emacs.d` directory has the following structure:

```
$> tree .emacs.d/
.emacs.d/
|-- config/
|   |-- completion.el
|   |-- control-version.el
|   |-- external-command-whole-buffer.el
|   |-- highligth-current-line.el
|   |-- modes/
|   |   |-- flymake-mode.el
|   |   |-- markdown-mode.el
|   |   |-- po-mode.el
|   |   |-- programming/
|   |   |   |-- c-mode.el
|   |   |   |-- css-mode.el
|   |   |   |-- global.el
|   |   |   |-- js-mode.el
|   |   |   |-- perl-mode.el
|   |   |   |-- php-mode.el
|   |   |   |-- python-mode.el
|   |   |   |-- sh-mode.el
|   |   |   `-- yasnippet.el
|   |   |-- xml-mode.el
|   |   `-- yaml-mode.el
|   |-- rename-frame.el
|   |-- revert-all-buffers.el
|   |-- sh.el
|   `-- windows.el
`-- load-directory-mu.el
```

To load all of the `.el` files, from `~/.emacs.d` you would do:

```
(load-directory-mu "~/.emacs.d")
```

---

## license

The project `'load-directory-mu'` is licensed under the MIT License.

See [LICENSE](./LICENSE) for more details.

The latest source code can be retrieved from one of several mirrors:

1. [github.com/valera-rozuvan/load-directory-mu](https://github.com/valera-rozuvan/load-directory-mu)

2. [gitlab.com/valera-rozuvan/load-directory-mu](https://gitlab.com/valera-rozuvan/load-directory-mu)

3. [git.rozuvan.net/load-directory-mu](https://git.rozuvan.net/load-directory-mu)

Copyright (c) 2015-2022 [Valera Rozuvan](https://valera.rozuvan.net/)

Copyright (c) 2014 [Emanuele Tomasi](https://github.com/targzeta)
